{
  description = "kompreni neovim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        # Files that make up the config, copied into the wrapped nvim's
        # XDG_CONFIG_HOME so lazy.nvim and friends can read them.
        configDir = pkgs.stdenvNoCC.mkDerivation {
          name = "kompreni-nvim-config";
          src = pkgs.lib.cleanSourceWith {
            src = ./.;
            filter = path: type:
              let base = baseNameOf (toString path); in
              base != "flake.nix"
              && base != "flake.lock"
              && base != ".git"
              && base != ".direnv"
              && base != "result";
          };
          installPhase = ''
            mkdir -p $out/nvim
            cp -r . $out/nvim/
          '';
        };

        # Runtime tools that plugins shell out to.
        runtimeDeps = with pkgs; [
          git
          curl
          unzip
          gnumake
          gcc
          ripgrep
          fd
          nodejs
          tree-sitter   # :TSUpdate
          stylua        # conform fmt for lua

          # LSPs (replacing mason-managed installs)
          elixir-ls
          vscode-langservers-extracted   # eslint, html, css, json
          gopls
          graphql-language-service-cli
          lua-language-server
          tailwindcss-language-server
          zls
          # mdx-analyzer is not packaged in nixpkgs — install via npm if needed.

          # Language runtimes the LSPs/dap need
          go
          elixir
          zig
        ];

        nvimWrapped = pkgs.symlinkJoin {
          name = "nvim-kompreni";
          paths = [ pkgs.neovim-unwrapped ];
          nativeBuildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/nvim \
              --set NVIM_APPNAME "nvim" \
              --set XDG_CONFIG_HOME "${configDir}" \
              --prefix PATH : ${pkgs.lib.makeBinPath runtimeDeps}
          '';
        };
      in
      {
        packages.default = nvimWrapped;

        apps.default = {
          type = "app";
          program = "${nvimWrapped}/bin/nvim";
        };

        devShells.default = pkgs.mkShell {
          packages = runtimeDeps ++ [ pkgs.neovim-unwrapped ];
        };
      });
}
