let
  nixpkgs =
    import (builtins.fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/2362848adf8def2866fabbffc50462e929d7fffb.tar.gz;
    }) { };

    myRubyEnv = nixpkgs.buildEnv {
      name = "my-ruby-env";
      paths = [ nixpkgs.ruby_3_1 ];
    };

    myEnv = nixpkgs.buildEnv {
      name = "my-env";
      paths = [ myRubyEnv nixpkgs.bundler nixpkgs.yarn ];
    };
in
nixpkgs.mkShell {
  buildInputs = [
    myEnv
  ];

  shellHook = ''
    export GEM_HOME=$(pwd)/.gem
    export GEM_PATH=$(pwd)/.gem
    echo $PATH
    gem install rails
    bundle install --path .gem
  '';
}