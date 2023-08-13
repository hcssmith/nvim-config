vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'lewis6991/gitsigns.nvim',
    config = require('gitsigns').setup();
  }

  use 'vim-crystal/vim-crystal'

  use {
    'folke/tokyonight.nvim',
    config = require('tokyonight').setup({
      style = 'storm'
    })
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      {'nvim-tree/nvim-web-devicons'},
    },
    config = require("nvim-tree").setup({
      view = {
        adaptive_size = true
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
    })
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = require'lualine'.setup{
      options = {
        theme = 'tokyonight',
        icons_enabled = true,
      },
      sections = {
        lualine_a = {
          {
            'filename',
            path = 1,
          }
        },
        lualine_c = {
          'data',
          "require'lsp-status'.status()" }
        }
      },
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
      {
        'folke/neodev.nvim',
        config = require("neodev").setup({})
      },
  }
}

use 'neovim/nvim-lspconfig'

use {
  'nvim-treesitter/nvim-treesitter',
  run = function()
    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    ts_update()
  end,
  config = require'nvim-treesitter.configs'.setup {
    ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
}
  end)
