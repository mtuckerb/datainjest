{
  description = "datainjest";

  inputs = {
    flake-schemas.url = "https://flakehub.com/f/DeterminateSystems/flake-schemas/*.tar.gz";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*.tar.gz";
  };

  outputs = { self, flake-schemas, nixpkgs }:
    let
      # Helpers for producing system-specific outputs
      supportedSystems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" "aarch64-linux" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { 
          inherit system; 
          config.permittedInsecurePackages = ["openssl-1.1.1w"];
        };
      });
    in {
      schemas = flake-schemas.schemas;

      packages = forEachSupportedSystem ({ pkgs }:
        let
          targetRuby = pkgs.ruby_3_3; 
          myBundler = pkgs.bundler.override {
            ruby = targetRuby;
          };
          gems = pkgs.bundlerEnv {
            ruby = targetRuby;
            name = "datainjest";
            bundler = myBundler;
            gemfile = ./Gemfile;
            lockfile = ./Gemfile.lock;
            gemset = ./gemset.nix;
          };
        in {
          default = self.packages.${pkgs.system}.datainjest;
          inherit gems;
          datainjest = pkgs.writeShellScriptBin "datainjest" ''
            #!/usr/bin/env bash
            set -e
            DATA_DIR=''${1:-/var/lib/datainjest}
            mkdir -p $DATA_DIR/tmp $DATA_DIR/logs
            chmod -R 755 $DATA_DIR

            echo "Running Data Ingester..."
              TMP_DIR=$DATA_DIR/tmp \
              TMPDIR=$DATA_DIR/tmp \
              LOG_DIR=$DATA_DIR/logs \
              RAILS_TMP_PATH=$DATA_DIR/tmp \
              RAILS_LOG_PATH=$DATA_DIR/logs \
              RAILS_SERVE_STATIC_FILES=true \
              RAILS_ENV=production \
              bundle exec puma -C config/puma.rb -b tcp://0.0.0.0:5007 -p 5007 &
            echo "finished starting datainjest"
          '';
        }
      );

      apps = forEachSupportedSystem ({ pkgs }: {
        default = self.apps.${pkgs.system}.datainjest;
        datainjest = {
          type = "app";
          program = "${self.packages.${pkgs.system}.datainjest}/bin/datainjest";
        };
      });

      devShells = forEachSupportedSystem ({ pkgs }: 
        let
          targetRuby = pkgs.ruby_3_3; # Make sure this matches the version in packages
          gems = self.packages.${pkgs.system}.gems; # Access gems from packages
        in {
          default = pkgs.mkShell {
            shellHook = ''
              export BUNDLE_DISABLE_SHARED_GEMS=true
            '';
            buildInputs = with pkgs; [
              targetRuby
              bundler
              nodejs
              yarn
              postgresql
            ];
            packages = with pkgs; [
              nodePackages.yarn
              rubocop
              curl
              git
              wget
              nixpkgs-fmt
              postgresql_16
              libiconv
              libyaml
              pm2
              self.packages.${pkgs.system}.datainjest
            ];
          };
        }
      );

      nixosModules.default = { config, lib, pkgs, ... }: 
        let
          cfg = config.services.datainjest;
        in {
          options.services.datainjest= {
            enable = lib.mkEnableOption "datainjest service";
            package = lib.mkOption {
              type = lib.types.package;
              default = self.packages.${pkgs.system}.datainjest;
              description = "The datainjest package to use";
            };
            dataDir = lib.mkOption {
              type = lib.types.str;
              default = "/var/lib/datainjest";
              description = "Directory to store ingest data";
            };
          };

          config = lib.mkIf cfg.enable {
            system.activationScripts.datainjest-debug = ''
              echo "Datainjest module is being loaded and enabled"
            '';
            systemd.services.datainjest = {
              description = "datainjest Service";
              after = [ "network.target" ];
              wantedBy = [ "multi-user.target" ];
              serviceConfig = {
                ExecStart = "${cfg.package}/bin/datainjest ${cfg.dataDir}";
                Restart = "on-failure";
                StateDirectory = "datainjest";
                RuntimeDirectory = "datainjest";
                LogsDirectory = "datainjest";
                WorkingDirectory = "${self}";
                User = "datainjest";
                Group = "datainjest";
              };
              environment = {
                HOME = cfg.dataDir;
                TMP_DIR = "${cfg.dataDir}/tmp";
                TMPDIR = "${cfg.dataDir}/tmp";
                LOG_DIR = "${cfg.dataDir}/logs";
                RAILS_TMP_PATH = "${cfg.dataDir}/tmp";
                RAILS_LOG_PATH = "${cfg.dataDir}/logs";
                RAILS_SERVE_STATIC_FILES = "true";
                RAILS_ENV = "production";
              };
            };

            system.activationScripts.datainjest-data-dir = ''
              mkdir -p ${cfg.dataDir}
              chown -R datainjest:datainjest ${cfg.dataDir}
            '';

            users.users.datainjest = {
              isSystemUser = true;
              group = "datainjest";
              home = cfg.dataDir;
              createHome = true;
            };
            users.groups.datainjest = {};
          };
        };
    };
}