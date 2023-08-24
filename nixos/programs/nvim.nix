{ inputs, outputs, pkgs, ... }: {
  programs.nixneovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # extraConfigVim = ''
    #   # you can add your old config to make the switch easier
    #   ${lib.strings.fileContents ./init.vim}
    #   # or with lua
    #   lua << EOF
    #     ${lib.strings.fileContents ./init.lua}
    #   EOF
    # '';

    globals.mapleader = " "; # Sets the leader key to space

    options = {
      number = true;         # Show line numbers
      relativenumber = true; # Show relative line numbers

      shiftwidth = 2;        # Tab width should be 2
    };

    # to install plugins just activate their modules
    plugins = {
      lsp = {
        enable = true;
        servers = {
          rust-analyzer.enable = true;
        };
      };
      treesitter = {
        enable = true;
        indent = true;
        installAllGrammars = true;
      };
      mini = {
        enable = true;
        ai.enable = true;
        jump.enable = true;
      };
    };

    # Not all plugins have own modules
    # You can add missing plugins here
    # `pkgs.vimExtraPlugins` is added by the overlay you added at the beginning
    # For a list of available plugins, look here: [available plugins](https://github.com/jooooscha/nixpkgs-vim-extra-plugins/blob/main/plugins.md)
    extraPlugins = with pkgs.vimExtraPlugins; [
      cobalt2-nvim
      colorbuddy-nvim
    ];
  };
}

