{
  description = "dataingest";

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
            name = "dataingest";
            bundler = myBundler;
            gemfile = ./Gemfile;
            lockfile = ./Gemfile.lock;
            gemset = ./gemset.nix;
          };
        in {
          default = self.packages.${pkgs.system}.dataingest;
          inherit gems;
          dataingest = pkgs.writeShellScriptBin "dataingest" ''
            #!/usr/bin/env bash
            set -e
            DATA_DIR=''${1:-/var/lib/dataingest}
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
              bundle exec puma -C config/puma.rb -b 10.1.0.75 -p 5007 &
            echo "finished starting dataingest"
          '';
        }
      );

      apps = forEachSupportedSystem ({ pkgs }: {
        default = self.apps.${pkgs.system}.dataingest;
        dataingest = {
          type = "app";
          program = "${self.packages.${pkgs.system}.dataingest}/bin/dataingest";
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
              self.packages.${pkgs.system}.dataingest
            ];
          };
        }
      );

      nixosModules.default = { config, lib, pkgs, ... }: 
        let
          cfg = config.services.dataingest;
        in {
          options.services.dataingest= {
            enable = lib.mkEnableOption "DataIngest service";
            package = lib.mkOption {
              type = lib.types.package;
              default = self.packages.${pkgs.system}.dataingest;
              description = "The dataingest package to use";
            };
            dataDir = lib.mkOption {
              type = lib.types.str;
              default = "/var/lib/dataingest";
              description = "Directory to store ingest data";
            };
          };

          config = lib.mkIf cfg.enable {
            systemd.services.dataingest = {
              description = "Dataingest Service";
              after = [ "network.target" ];
              wantedBy = [ "multi-user.target" ];
              serviceConfig = {
                ExecStart = "${cfg.package}/bin/dataingest ${cfg.dataDir}";
                Restart = "on-failure";
                StateDirectory = "dataingest";
                RuntimeDirectory = "dataingest";
                LogsDirectory = "dataingest";
                WorkingDirectory = "${self}";
                User = "dataingest";
                Group = "dataingest";
              };
              environment = {
                HOME = cfg.dataDir;
              };
            };

            system.activationScripts.dataingest-data-dir = ''
              mkdir -p ${cfg.dataDir}
              chown -R dataingest:dataingest ${cfg.dataDir}
            '';

            users.users.dataingest = {
              isSystemUser = true;
              group = "dataingest";
              home = cfg.dataDir;
              createHome = true;
            };
            users.groups.dataingest = {};
          };
        };
    };
}