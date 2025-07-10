{
  actioncable = {
    dependencies = ["actionpack" "activesupport" "nio4r" "websocket-driver" "zeitwerk"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18496axh89kakw5f82mmmac3w9rwb0b0wq4j6la806p9cbgy5k3v";
      type = "gem";
    };
    version = "8.0.2";
  };
  actionmailbox = {
    dependencies = ["actionpack" "activejob" "activerecord" "activestorage" "activesupport" "mail"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nyfwa1kj0cm1scqsbv723ypv69bzaxh886hliyjbrhk752v73rx";
      type = "gem";
    };
    version = "8.0.2";
  };
  actionmailer = {
    dependencies = ["actionpack" "actionview" "activejob" "activesupport" "mail" "rails-dom-testing"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1l3pnba14p0p7zsh366c31maxap030c97597vjimdv3nhnrnijdh";
      type = "gem";
    };
    version = "8.0.2";
  };
  actionpack = {
    dependencies = ["actionview" "activesupport" "nokogiri" "rack" "rack-session" "rack-test" "rails-dom-testing" "rails-html-sanitizer" "useragent"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0y2b5ydiqy32jbd9g5bl6v4aw6d7pjn5f3w2rxf2j59q9w307rwk";
      type = "gem";
    };
    version = "8.0.2";
  };
  actiontext = {
    dependencies = ["actionpack" "activerecord" "activestorage" "activesupport" "globalid" "nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1grs41yr3nzw7zbnz0vkv8f4qd448a632saxkm3vnbzf68hb63d4";
      type = "gem";
    };
    version = "8.0.2";
  };
  actionview = {
    dependencies = ["activesupport" "builder" "erubi" "rails-dom-testing" "rails-html-sanitizer"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fyfyxf2a798lxq6sfpnj94kmnpfp17xlhvjy428zhfzbi0f2f70";
      type = "gem";
    };
    version = "8.0.2";
  };
  activejob = {
    dependencies = ["activesupport" "globalid"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jjk31di5kvcflc90wmgdd50jzhljhafi166h6hg67kbwd2qn8mh";
      type = "gem";
    };
    version = "8.0.2";
  };
  activemodel = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0v35y2jzqlfy1wnrzlzj2cxylhnz09vykaa1l2dnkq7sl5zzpq8a";
      type = "gem";
    };
    version = "8.0.2";
  };
  activerecord = {
    dependencies = ["activemodel" "activesupport" "timeout"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02nrya34qviawdkssyahb3mg08kqdc461b320a6ikr245jwp0d3r";
      type = "gem";
    };
    version = "8.0.2";
  };
  activestorage = {
    dependencies = ["actionpack" "activejob" "activerecord" "activesupport" "marcel"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xr9cy6h8il61qq6w3rkvl56visms45ljm8f43r3ibh61wg24ggq";
      type = "gem";
    };
    version = "8.0.2";
  };
  activesupport = {
    dependencies = ["base64" "benchmark" "bigdecimal" "concurrent-ruby" "connection_pool" "drb" "i18n" "logger" "minitest" "securerandom" "tzinfo" "uri"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0pm40y64wfc50a9sj87kxvil2102rmpdcbv82zf0r40vlgdwsrc5";
      type = "gem";
    };
    version = "8.0.2";
  };
  ast = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.4.3";
  };
  base64 = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.3.0";
  };
  benchmark = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.4.1";
  };
  bigdecimal = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "3.2.2";
  };
  bootsnap = {
    dependencies = ["msgpack"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.18.6";
  };
  brakeman = {
    dependencies = ["racc"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "7.0.2";
  };
  builder = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "3.3.0";
  };
  concurrent-ruby = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.3.5";
  };
  connection_pool = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.5.3";
  };
  crass = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.0.6";
  };
  csv = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "3.3.5";
  };
  date = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "3.4.1";
  };
  debug = {
    dependencies = ["irb" "reline"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.11.0";
  };
  dotenv = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "3.1.8";
  };
  dotenv-rails = {
    dependencies = ["dotenv" "railties"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "3.1.8";
  };
  drb = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.2.3";
  };
  erb = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "5.0.1";
  };
  erubi = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.13.1";
  };
  globalid = {
    dependencies = ["activesupport"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.2.1";
  };
  httparty = {
    dependencies = ["csv" "mini_mime" "multi_xml"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mbbjr774zxb2wcpbwc93l0i481bxk7ga5hpap76w3q1y9idvh9s";
      type = "gem";
    };
    version = "0.23.1";
  };
  i18n = {
    dependencies = ["concurrent-ruby"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.14.7";
  };
  io-console = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.8.0";
  };
  irb = {
    dependencies = ["pp" "rdoc" "reline"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.15.2";
  };
  json = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1x5b8ipv6g0z44wgc45039k04smsyf95h2m5m67mqq35sa5a955s";
      type = "gem";
    };
    version = "2.12.2";
  };
  language_server-protocol = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "3.17.0.5";
  };
  lint_roller = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.1.0";
  };
  logger = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.7.0";
  };
  loofah = {
    dependencies = ["crass" "nokogiri"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.24.1";
  };
  mail = {
    dependencies = ["mini_mime" "net-imap" "net-pop" "net-smtp"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.8.1";
  };
  marcel = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.0.4";
  };
  mini_mime = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.1.5";
  };
  minitest = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "5.25.5";
  };
  msgpack = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.8.0";
  };
  multi_xml = {
    dependencies = ["bigdecimal"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.7.2";
  };
  net-imap = {
    dependencies = ["date" "net-protocol"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.5.9";
  };
  net-pop = {
    dependencies = ["net-protocol"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.1.2";
  };
  net-protocol = {
    dependencies = ["timeout"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.2.2";
  };
  net-smtp = {
    dependencies = ["net-protocol"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.5.1";
  };
  nio4r = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.7.4";
  };
  nokogiri = {
    dependencies = ["racc"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.18.8";
  };
  parallel = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.27.0";
  };
  parser = {
    dependencies = ["ast" "racc"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "3.3.8.0";
  };
  pp = {
    dependencies = ["prettyprint"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.6.2";
  };
  prettyprint = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.2.0";
  };
  prism = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.4.0";
  };
  psych = {
    dependencies = ["date" "stringio"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "5.2.6";
  };
  puma = {
    dependencies = ["nio4r"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "6.6.0";
  };
  racc = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.8.1";
  };
  rack = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "3.1.16";
  };
  rack-session = {
    dependencies = ["base64" "rack"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.1.1";
  };
  rack-test = {
    dependencies = ["rack"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.2.0";
  };
  rackup = {
    dependencies = ["rack"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.2.1";
  };
  rails = {
    dependencies = ["actioncable" "actionmailbox" "actionmailer" "actionpack" "actiontext" "actionview" "activejob" "activemodel" "activerecord" "activestorage" "activesupport" "railties"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ik4y7c545pb9lf70prv0n4drblwjlaxb22fhq18wf607slabypx";
      type = "gem";
    };
    version = "8.0.2";
  };
  rails-dom-testing = {
    dependencies = ["activesupport" "minitest" "nokogiri"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.3.0";
  };
  rails-html-sanitizer = {
    dependencies = ["loofah" "nokogiri"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.6.2";
  };
  railties = {
    dependencies = ["actionpack" "activesupport" "irb" "rackup" "rake" "thor" "zeitwerk"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yaw5sw9vxvvkkc335laxv2k34rs2nxx9hdsy604k9wvqi03yz0d";
      type = "gem";
    };
    version = "8.0.2";
  };
  rainbow = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "3.1.1";
  };
  rake = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "13.3.0";
  };
  rdoc = {
    dependencies = ["erb" "psych"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "6.14.2";
  };
  redcarpet = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "3.6.1";
  };
  regexp_parser = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.10.0";
  };
  reline = {
    dependencies = ["io-console"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.6.1";
  };
  rubocop = {
    dependencies = ["json" "language_server-protocol" "lint_roller" "parallel" "parser" "rainbow" "regexp_parser" "rubocop-ast" "ruby-progressbar" "unicode-display_width"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.78.0";
  };
  rubocop-ast = {
    dependencies = ["parser" "prism"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.45.1";
  };
  rubocop-performance = {
    dependencies = ["lint_roller" "rubocop" "rubocop-ast"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.25.0";
  };
  rubocop-rails = {
    dependencies = ["activesupport" "lint_roller" "rack" "rubocop" "rubocop-ast"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.32.0";
  };
  rubocop-rails-omakase = {
    dependencies = ["rubocop" "rubocop-performance" "rubocop-rails"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.1.0";
  };
  ruby-progressbar = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.13.0";
  };
  securerandom = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.4.1";
  };
  sqlite3 = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.7.2";
  };
  stringio = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "3.1.7";
  };
  thor = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "1.3.2";
  };
  timeout = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.4.3";
  };
  tzinfo = {
    dependencies = ["concurrent-ruby"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.0.6";
  };
  unicode-display_width = {
    dependencies = ["unicode-emoji"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "3.1.4";
  };
  unicode-emoji = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "4.0.4";
  };
  uri = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04bhfvc25b07jaiaf62yrach7khhr5jlr5bx6nygg8pf11329wp9";
      type = "gem";
    };
    version = "1.0.3";
  };
  useragent = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.16.11";
  };
  websocket-driver = {
    dependencies = ["base64" "websocket-extensions"];
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.8.0";
  };
  websocket-extensions = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "0.1.5";
  };
  zeitwerk = {
    groups = [];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
      type = "gem";
    };
    version = "2.7.3";
  };
}
