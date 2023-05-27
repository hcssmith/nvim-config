vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'lewis6991/gitsigns.nvim'

  use 'vim-crystal/vim-crystal'

  use 'folke/tokyonight.nvim'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      {'nvim-tree/nvim-web-devicons'},
    },
    config = require('nvim-tree').setup({})
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      {'nvim-lua/lsp-status.nvim'},
    }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},

      -- neovim lua config support
      {'folke/neodev.nvim'},
    }
  }

  use 'neovim/nvim-lspconfig'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,}
  end)
