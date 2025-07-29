{
  actioncable = {
    dependencies = ["actionpack" "activesupport" "nio4r" "websocket-driver" "zeitwerk"];
    source = {
      sha256 = "5b3b885075a80767d63cbf2b586cbf82466a241675b7985233f957abb01bffb4";
      type = "gem";
    };
    version = "7.2.2.1";
  };
  actionmailbox = {
    dependencies = ["actionpack" "activejob" "activerecord" "activestorage" "activesupport" "mail"];
    source = {
      sha256 = "896a47c2520f4507c75dde67c6ea1f5eec3a041fe7bfbf3568c4e0149a080e25";
      type = "gem";
    };
    version = "7.2.2.1";
  };
  actionmailer = {
    dependencies = ["actionpack" "actionview" "activejob" "activesupport" "mail" "rails-dom-testing"];
    source = {
      sha256 = "b02ae523c32c8ad762d4db941e76f3c108c106030132247ee7a7b8c86bc7b21f";
      type = "gem";
    };
    version = "7.2.2.1";
  };
  actionpack = {
    dependencies = ["actionview" "activesupport" "nokogiri" "racc" "rack" "rack-session" "rack-test" "rails-dom-testing" "rails-html-sanitizer" "useragent"];
    source = {
      sha256 = "17b2160a7bcbd5a569d06b1ae54a4bb5ccc7ba0815d73ff5768100a79dc1f734";
      type = "gem";
    };
    version = "7.2.2.1";
  };
  actiontext = {
    dependencies = ["actionpack" "activerecord" "activestorage" "activesupport" "globalid" "nokogiri"];
    source = {
      sha256 = "f369cee41a6674b697bf9257d917a3dce575a2c89935af437b432d6737a3f0d6";
      type = "gem";
    };
    version = "7.2.2.1";
  };
  actionview = {
    dependencies = ["activesupport" "builder" "erubi" "rails-dom-testing" "rails-html-sanitizer"];
    source = {
      sha256 = "69fc880cf3d8b1baf21b048cf7bb68f1eef08760ff8104d7d60a6a1be8b359a5";
      type = "gem";
    };
    version = "7.2.2.1";
  };
  activejob = {
    dependencies = ["activesupport" "globalid"];
    source = {
      sha256 = "f2f95a8573b394aa4f7c24843f0c4a6065c073a5c64d6f15ecd98d98c2c23e5b";
      type = "gem";
    };
    version = "7.2.2.1";
  };
  activemodel = {
    dependencies = ["activesupport"];
    source = {
      sha256 = "8398861f9ee2c4671a8357ab39e9b38a045fd656f6685a3dd5890c2419dbfdaf";
      type = "gem";
    };
    version = "7.2.2.1";
  };
  activerecord = {
    dependencies = ["activemodel" "activesupport" "timeout"];
    source = {
      sha256 = "79a31f71c32d5138717c2104e0ff105f5d82922247c85bdca144f2720e67fab9";
      type = "gem";
    };
    version = "7.2.2.1";
  };
  activestorage = {
    dependencies = ["actionpack" "activejob" "activerecord" "activesupport" "marcel"];
    source = {
      sha256 = "b4ec35ff94d4d6656ee6952ce439c3f80e249552d49fd2d3996ee53880c5525f";
      type = "gem";
    };
    version = "7.2.2.1";
  };
  activesupport = {
    dependencies = ["base64" "benchmark" "bigdecimal" "concurrent-ruby" "connection_pool" "drb" "i18n" "logger" "minitest" "securerandom" "tzinfo"];
    source = {
      sha256 = "842bcbf8a92977f80fb4750661a237cf5dd4fdd442066b3c35e88afb488647f5";
      type = "gem";
    };
    version = "7.2.2.1";
  };
  ast = {
    source = {
      sha256 = "954615157c1d6a382bc27d690d973195e79db7f55e9765ac7c481c60bdb4d383";
      type = "gem";
    };
    version = "2.4.3";
  };
  base64 = {
    source = {
      sha256 = "27337aeabad6ffae05c265c450490628ef3ebd4b67be58257393227588f5a97b";
      type = "gem";
    };
    version = "0.3.0";
  };
  benchmark = {
    source = {
      sha256 = "d4ef40037bba27f03b28013e219b950b82bace296549ec15a78016552f8d2cce";
      type = "gem";
    };
    version = "0.4.1";
  };
  bigdecimal = {
    source = {
      sha256 = "39085f76b495eb39a79ce07af716f3a6829bc35eb44f2195e2753749f2fa5adc";
      type = "gem";
    };
    version = "3.2.2";
  };
  bootsnap = {
    dependencies = ["msgpack"];
    source = {
      sha256 = "0ae2393c1e911e38be0f24e9173e7be570c3650128251bf06240046f84a07d00";
      type = "gem";
    };
    version = "1.18.6";
  };
  brakeman = {
    dependencies = ["racc"];
    source = {
      sha256 = "b602d91bcec6c5ce4d4bc9e081e01f621c304b7a69f227d1e58784135f333786";
      type = "gem";
    };
    version = "7.0.2";
  };
  builder = {
    source = {
      sha256 = "497918d2f9dca528fdca4b88d84e4ef4387256d984b8154e9d5d3fe5a9c8835f";
      type = "gem";
    };
    version = "3.3.0";
  };
  bundle = {
    dependencies = [];
    source = {
      sha256 = "9a26002c267dc1078ce38cd125f6d6ce5104f81d758c0323d09870a2b3a11fa9";
      type = "gem";
    };
    version = "0.0.1";
  };
  chronic = {
    source = {
      sha256 = "766f2fcce6ac3cc152249ed0f2b827770d3e517e2e87c5fba7ed74f4889d2dc3";
      type = "gem";
    };
    version = "0.10.2";
  };
  concurrent-ruby = {
    source = {
      sha256 = "813b3e37aca6df2a21a3b9f1d497f8cbab24a2b94cab325bffe65ee0f6cbebc6";
      type = "gem";
    };
    version = "1.3.5";
  };
  connection_pool = {
    source = {
      sha256 = "cfd74a82b9b094d1ce30c4f1a346da23ee19dc8a062a16a85f58eab1ced4305b";
      type = "gem";
    };
    version = "2.5.3";
  };
  crass = {
    source = {
      sha256 = "dc516022a56e7b3b156099abc81b6d2b08ea1ed12676ac7a5657617f012bd45d";
      type = "gem";
    };
    version = "1.0.6";
  };
  csv = {
    source = {
      sha256 = "6e5134ac3383ef728b7f02725d9872934f523cb40b961479f69cf3afa6c8e73f";
      type = "gem";
    };
    version = "3.3.5";
  };
  date = {
    source = {
      sha256 = "bf268e14ef7158009bfeaec40b5fa3c7271906e88b196d958a89d4b408abe64f";
      type = "gem";
    };
    version = "3.4.1";
  };
  debug = {
    dependencies = ["irb" "reline"];
    source = {
      sha256 = "1425db64cfa0130c952684e3dc974985be201dd62899bf4bbe3f8b5d6cf1aef2";
      type = "gem";
    };
    version = "1.11.0";
  };
  dotenv = {
    source = {
      sha256 = "9e1176060ced581f8e6ce4384e91361817763a76e3c625c8bddc18b35bd392c3";
      type = "gem";
    };
    version = "3.1.8";
  };
  dotenv-rails = {
    dependencies = ["dotenv" "railties"];
    source = {
      sha256 = "46c9d1226a8b58a83b5f61325aa8cffd25cea1c0fafdfbbbee1e5dfea77980c4";
      type = "gem";
    };
    version = "3.1.8";
  };
  drb = {
    source = {
      sha256 = "0b00d6fdb50995fe4a45dea13663493c841112e4068656854646f418fda13373";
      type = "gem";
    };
    version = "2.2.3";
  };
  erb = {
    source = {
      sha256 = "760439803b36cc93eca8a266aab614614e588024a89bc30a62e78d98ff452c23";
      type = "gem";
    };
    version = "5.0.1";
  };
  erubi = {
    source = {
      sha256 = "a082103b0885dbc5ecf1172fede897f9ebdb745a4b97a5e8dc63953db1ee4ad9";
      type = "gem";
    };
    version = "1.13.1";
  };
  globalid = {
    dependencies = ["activesupport"];
    source = {
      sha256 = "70bf76711871f843dbba72beb8613229a49429d1866828476f9c9d6ccc327ce9";
      type = "gem";
    };
    version = "1.2.1";
  };
  httparty = {
    dependencies = ["csv" "mini_mime" "multi_xml"];
    source = {
      sha256 = "78652a5c9471cf0093d3b2083c2295c9c8f12b44c65112f1846af2b71430fa6c";
      type = "gem";
    };
    version = "0.22.0";
  };
  i18n = {
    dependencies = ["concurrent-ruby"];
    source = {
      sha256 = "ceba573f8138ff2c0915427f1fc5bdf4aa3ab8ae88c8ce255eb3ecf0a11a5d0f";
      type = "gem";
    };
    version = "1.14.7";
  };
  io-console = {
    source = {
      sha256 = "cd6a9facbc69871d69b2cb8b926fc6ea7ef06f06e505e81a64f14a470fddefa2";
      type = "gem";
    };
    version = "0.8.0";
  };
  irb = {
    dependencies = ["pp" "rdoc" "reline"];
    source = {
      sha256 = "222f32952e278da34b58ffe45e8634bf4afc2dc7aa9da23fed67e581aa50fdba";
      type = "gem";
    };
    version = "1.15.2";
  };
  json = {
    source = {
      sha256 = "ba94a48ad265605c8fa9a50a5892f3ba6a02661aa010f638211f3cb36f44abf4";
      type = "gem";
    };
    version = "2.12.2";
  };
  language_server-protocol = {
    source = {
      sha256 = "fd1e39a51a28bf3eec959379985a72e296e9f9acfce46f6a79d31ca8760803cc";
      type = "gem";
    };
    version = "3.17.0.5";
  };
  lint_roller = {
    source = {
      sha256 = "2c0c845b632a7d172cb849cc90c1bce937a28c5c8ccccb50dfd46a485003cc87";
      type = "gem";
    };
    version = "1.1.0";
  };
  logger = {
    source = {
      sha256 = "196edec7cc44b66cfb40f9755ce11b392f21f7967696af15d274dde7edff0203";
      type = "gem";
    };
    version = "1.7.0";
  };
  loofah = {
    dependencies = ["crass" "nokogiri"];
    source = {
      sha256 = "655a30842b70ec476410b347ab1cd2a5b92da46a19044357bbd9f401b009a337";
      type = "gem";
    };
    version = "2.24.1";
  };
  mail = {
    dependencies = ["mini_mime" "net-imap" "net-pop" "net-smtp"];
    source = {
      sha256 = "ec3b9fadcf2b3755c78785cb17bc9a0ca9ee9857108a64b6f5cfc9c0b5bfc9ad";
      type = "gem";
    };
    version = "2.8.1";
  };
  marcel = {
    source = {
      sha256 = "0d5649feb64b8f19f3d3468b96c680bae9746335d02194270287868a661516a4";
      type = "gem";
    };
    version = "1.0.4";
  };
  mini_mime = {
    source = {
      sha256 = "8681b7e2e4215f2a159f9400b5816d85e9d8c6c6b491e96a12797e798f8bccef";
      type = "gem";
    };
    version = "1.1.5";
  };
  minitest = {
    source = {
      sha256 = "391b6c6cb43a4802bfb7c93af1ebe2ac66a210293f4a3fb7db36f2fc7dc2c756";
      type = "gem";
    };
    version = "5.25.5";
  };
  msgpack = {
    source = {
      sha256 = "e64ce0212000d016809f5048b48eb3a65ffb169db22238fb4b72472fecb2d732";
      type = "gem";
    };
    version = "1.8.0";
  };
  multi_xml = {
    dependencies = ["bigdecimal"];
    source = {
      sha256 = "307a96dc48613badb7b2fc174fd4e62d7c7b619bc36ea33bfd0c49f64f5787ce";
      type = "gem";
    };
    version = "0.7.2";
  };
  net-imap = {
    dependencies = ["date" "net-protocol"];
    source = {
      sha256 = "d95905321e1bd9f294ffc7ff8697be218eee1ec96c8504c0960964d0a0be33fc";
      type = "gem";
    };
    version = "0.5.9";
  };
  net-pop = {
    dependencies = ["net-protocol"];
    source = {
      sha256 = "848b4e982013c15b2f0382792268763b748cce91c9e91e36b0f27ed26420dff3";
      type = "gem";
    };
    version = "0.1.2";
  };
  net-protocol = {
    dependencies = ["timeout"];
    source = {
      sha256 = "aa73e0cba6a125369de9837b8d8ef82a61849360eba0521900e2c3713aa162a8";
      type = "gem";
    };
    version = "0.2.2";
  };
  net-smtp = {
    dependencies = ["net-protocol"];
    source = {
      sha256 = "ed96a0af63c524fceb4b29b0d352195c30d82dd916a42f03c62a3a70e5b70736";
      type = "gem";
    };
    version = "0.5.1";
  };
  nio4r = {
    source = {
      sha256 = "d95dee68e0bb251b8ff90ac3423a511e3b784124e5db7ff5f4813a220ae73ca9";
      type = "gem";
    };
    version = "2.7.4";
  };
  nokogiri = {
    dependencies = ["racc"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1k2y1sid2n5wbxidlafn990ll307lqhc7qjyk2i1hgc7vdsphx2a";
      type = "gem";
    };
    version = "1.18.8";
  };
  parallel = {
    source = {
      sha256 = "4ac151e1806b755fb4e2dc2332cbf0e54f2e24ba821ff2d3dcf86bf6dc4ae130";
      type = "gem";
    };
    version = "1.27.0";
  };
  parser = {
    dependencies = ["ast" "racc"];
    source = {
      sha256 = "2476364142b307fa5a1b1ece44f260728be23858a9c71078e956131a75453c45";
      type = "gem";
    };
    version = "3.3.8.0";
  };
  pp = {
    dependencies = ["prettyprint"];
    source = {
      sha256 = "947ec3120c6f92195f8ee8aa25a7b2c5297bb106d83b41baa02983686577b6ff";
      type = "gem";
    };
    version = "0.6.2";
  };
  prettyprint = {
    source = {
      sha256 = "2bc9e15581a94742064a3cc8b0fb9d45aae3d03a1baa6ef80922627a0766f193";
      type = "gem";
    };
    version = "0.2.0";
  };
  prism = {
    source = {
      sha256 = "dc0e3e00e93160213dc2a65519d9002a4a1e7b962db57d444cf1a71565bb703e";
      type = "gem";
    };
    version = "1.4.0";
  };
  psych = {
    dependencies = ["date" "stringio"];
    source = {
      sha256 = "814328aa5dcb6d604d32126a20bc1cbcf05521a5b49dbb1a8b30a07e580f316e";
      type = "gem";
    };
    version = "5.2.6";
  };
  puma = {
    dependencies = ["nio4r"];
    source = {
      sha256 = "f25c06873eb3d5de5f0a4ebc783acc81a4ccfe580c760cfe323497798018ad87";
      type = "gem";
    };
    version = "6.6.0";
  };
  racc = {
    source = {
      sha256 = "4a7f6929691dbec8b5209a0b373bc2614882b55fc5d2e447a21aaa691303d62f";
      type = "gem";
    };
    version = "1.8.1";
  };
  rack = {
    source = {
      sha256 = "efb5606c351efc56b85b10c3493055d0d35209d23f44792ec4e1183eb0234635";
      type = "gem";
    };
    version = "3.1.16";
  };
  rack-session = {
    dependencies = ["base64" "rack"];
    source = {
      sha256 = "0b6dc07dea7e4b583f58a48e8b806d4c9f1c6c9214ebc202ec94562cbea2e4e9";
      type = "gem";
    };
    version = "2.1.1";
  };
  rack-test = {
    dependencies = ["rack"];
    source = {
      sha256 = "005a36692c306ac0b4a9350355ee080fd09ddef1148a5f8b2ac636c720f5c463";
      type = "gem";
    };
    version = "2.2.0";
  };
  rackup = {
    dependencies = ["rack"];
    source = {
      sha256 = "f737191fd5c5b348b7f0a4412a3b86383f88c43e13b8217b63d4c8d90b9e798d";
      type = "gem";
    };
    version = "2.2.1";
  };
  rails = {
    dependencies = ["actioncable" "actionmailbox" "actionmailer" "actionpack" "actiontext" "actionview" "activejob" "activemodel" "activerecord" "activestorage" "activesupport" "railties"];
    source = {
      sha256 = "aedb1604b40f4e43b5e8066e5a1aa34dae02c33aa9669b21fd4497d0f8c9bb40";
      type = "gem";
    };
    version = "7.2.2.1";
  };
  rails-dom-testing = {
    dependencies = ["activesupport" "minitest" "nokogiri"];
    source = {
      sha256 = "8acc7953a7b911ca44588bf08737bc16719f431a1cc3091a292bca7317925c1d";
      type = "gem";
    };
    version = "2.3.0";
  };
  rails-html-sanitizer = {
    dependencies = ["loofah" "nokogiri"];
    source = {
      sha256 = "35fce2ca8242da8775c83b6ba9c1bcaad6751d9eb73c1abaa8403475ab89a560";
      type = "gem";
    };
    version = "1.6.2";
  };
  railties = {
    dependencies = ["actionpack" "activesupport" "irb" "rackup" "rake" "thor" "zeitwerk"];
    source = {
      sha256 = "e3f11bf116dd6d0d874522843ccc70ec0f89fbfed3e9c2ee48a4778cd042fe1f";
      type = "gem";
    };
    version = "7.2.2.1";
  };
  rainbow = {
    source = {
      sha256 = "039491aa3a89f42efa1d6dec2fc4e62ede96eb6acd95e52f1ad581182b79bc6a";
      type = "gem";
    };
    version = "3.1.1";
  };
  rake = {
    source = {
      sha256 = "96f5092d786ff412c62fde76f793cc0541bd84d2eb579caa529aa8a059934493";
      type = "gem";
    };
    version = "13.3.0";
  };
  rdoc = {
    dependencies = ["erb" "psych"];
    source = {
      sha256 = "9fdd44df130f856ae70cc9a264dfd659b9b40de369b16581f4ab746e42439226";
      type = "gem";
    };
    version = "6.14.2";
  };
  redcarpet = {
    source = {
      sha256 = "d444910e6aa55480c6bcdc0cdb057626e8a32c054c29e793fa642ba2f155f445";
      type = "gem";
    };
    version = "3.6.1";
  };
  regexp_parser = {
    source = {
      sha256 = "cb6f0ddde88772cd64bff1dbbf68df66d376043fe2e66a9ef77fcb1b0c548c61";
      type = "gem";
    };
    version = "2.10.0";
  };
  reline = {
    dependencies = ["io-console"];
    source = {
      sha256 = "1afcc9d7cb1029cdbe780d72f2f09251ce46d3780050f3ec39c3ccc6b60675fb";
      type = "gem";
    };
    version = "0.6.1";
  };
  rubocop = {
    dependencies = ["json" "language_server-protocol" "lint_roller" "parallel" "parser" "rainbow" "regexp_parser" "rubocop-ast" "ruby-progressbar" "unicode-display_width"];
    source = {
      sha256 = "8b74a6f912eb4fd3e6878851f7f7f45dcad8c7185c34250d4f952b0ee80d6bc0";
      type = "gem";
    };
    version = "1.78.0";
  };
  rubocop-ast = {
    dependencies = ["parser" "prism"];
    source = {
      sha256 = "94042e49adc17f187ba037b33f941ba7398fede77cdf4bffafba95190a473a3e";
      type = "gem";
    };
    version = "1.45.1";
  };
  rubocop-performance = {
    dependencies = ["lint_roller" "rubocop" "rubocop-ast"];
    source = {
      sha256 = "6f7d03568a770054117a78d0a8e191cefeffb703b382871ca7743831b1a52ec1";
      type = "gem";
    };
    version = "1.25.0";
  };
  rubocop-rails = {
    dependencies = ["activesupport" "lint_roller" "rack" "rubocop" "rubocop-ast"];
    source = {
      sha256 = "9fcc623c8722fe71e835e99c4a18b740b5b0d3fb69915d7f0777f00794b30490";
      type = "gem";
    };
    version = "2.32.0";
  };
  rubocop-rails-omakase = {
    dependencies = ["rubocop" "rubocop-performance" "rubocop-rails"];
    source = {
      sha256 = "2af73ac8ee5852de2919abbd2618af9c15c19b512c4cfc1f9a5d3b6ef009109d";
      type = "gem";
    };
    version = "1.1.0";
  };
  ruby-progressbar = {
    source = {
      sha256 = "80fc9c47a9b640d6834e0dc7b3c94c9df37f08cb072b7761e4a71e22cff29b33";
      type = "gem";
    };
    version = "1.13.0";
  };
  securerandom = {
    source = {
      sha256 = "cc5193d414a4341b6e225f0cb4446aceca8e50d5e1888743fac16987638ea0b1";
      type = "gem";
    };
    version = "0.4.1";
  };
  sqlite3 = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "196l9p807asi8njjkjbhljvflhkpf9ncrbrk53n8yyp44h98npp1";
      type = "gem";
    };
    version = "2.7.2";
  };
  stringio = {
    source = {
      sha256 = "5b78b7cb242a315fb4fca61a8255d62ec438f58da2b90be66048546ade4507fa";
      type = "gem";
    };
    version = "3.1.7";
  };
  thor = {
    source = {
      sha256 = "eef0293b9e24158ccad7ab383ae83534b7ad4ed99c09f96f1a6b036550abbeda";
      type = "gem";
    };
    version = "1.3.2";
  };
  timeout = {
    source = {
      sha256 = "9509f079b2b55fe4236d79633bd75e34c1c1e7e3fb4b56cb5fda61f80a0fe30e";
      type = "gem";
    };
    version = "0.4.3";
  };
  tzinfo = {
    dependencies = ["concurrent-ruby"];
    source = {
      sha256 = "8daf828cc77bcf7d63b0e3bdb6caa47e2272dcfaf4fbfe46f8c3a9df087a829b";
      type = "gem";
    };
    version = "2.0.6";
  };
  unicode-display_width = {
    dependencies = ["unicode-emoji"];
    source = {
      sha256 = "8caf2af1c0f2f07ec89ef9e18c7d88c2790e217c482bfc78aaa65eadd5415ac1";
      type = "gem";
    };
    version = "3.1.4";
  };
  unicode-emoji = {
    source = {
      sha256 = "2c2c4ef7f353e5809497126285a50b23056cc6e61b64433764a35eff6c36532a";
      type = "gem";
    };
    version = "4.0.4";
  };
  useragent = {
    source = {
      sha256 = "700e6413ad4bb954bb63547fa098dddf7b0ebe75b40cc6f93b8d54255b173844";
      type = "gem";
    };
    version = "0.16.11";
  };
  vega = {
    source = {
      sha256 = "113f850fa4fdb8932d3085103b6784b6979392f5e879266c00481aa69c362368";
      type = "gem";
    };
    version = "0.4.0";
  };
  websocket-driver = {
    dependencies = ["base64" "websocket-extensions"];
    source = {
      sha256 = "ed0dba4b943c22f17f9a734817e808bc84cdce6a7e22045f5315aa57676d4962";
      type = "gem";
    };
    version = "0.8.0";
  };
  websocket-extensions = {
    source = {
      sha256 = "1c6ba63092cda343eb53fc657110c71c754c56484aad42578495227d717a8241";
      type = "gem";
    };
    version = "0.1.5";
  };
  zeitwerk = {
    source = {
      sha256 = "b2e86b4a9b57d26ba68a15230dcc7fe6f040f06831ce64417b0621ad96ba3e85";
      type = "gem";
    };
    version = "2.7.3";
  };
}
