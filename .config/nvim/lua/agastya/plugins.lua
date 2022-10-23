return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- LSP support
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  -- use "jose-elias-alvarez/null-ls.nvim"

  -- DAP support
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "nvim-telescope/telescope-dap.nvim"
  use "theHamsta/nvim-dap-virtual-text"

  -- Completion
  use "nvim-lua/plenary.nvim"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp-signature-help"
  use "hrsh7th/nvim-cmp"

  -- Better language support
  use "nvim-treesitter/nvim-treesitter"
  use "lervag/vimtex"
  use "mattn/emmet-vim"
  use "ap/vim-css-color"

  -- Quality of life improvements
  -- use "vim-airline/vim-airline"
  use "nvim-lualine/lualine.nvim"
  use "tpope/vim-surround"
  use "numToStr/Comment.nvim"
  -- use "windwp/nvim-ts-autotag"
  use "easymotion/vim-easymotion"
  use "onsails/lspkind.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "morhetz/gruvbox"
  use "folke/tokyonight.nvim"
  use "VebbNix/lf-vim"
  use "windwp/nvim-autopairs"
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  -- use "glepnir/dashboard-nvim"

  -- Better tooling
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb"
  use "L3MON4D3/LuaSnip"
  use "nvim-telescope/telescope-fzy-native.nvim"
  use "nvim-telescope/telescope.nvim"
  use "mickael-menu/zk-nvim"
  use "preservim/vim-pencil"
  use "ahmedkhalf/project.nvim"
end)
