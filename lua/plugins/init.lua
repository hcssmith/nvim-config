require("functions.util")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
  {
    'lewis6991/gitsigns.nvim',
    config = function () require('gitsigns').setup({}) end
  },
  'AlexvZyl/nordic.nvim',
  {
    'folke/tokyonight.nvim',
    config = function() require('tokyonight').setup({
      style = 'storm'
    }) end},
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function() require("nvim-tree").setup({
      view = {
        adaptive_size = true
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
    }) end
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function() require'lualine'.setup{
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
      } end,
    dependencies = {
      'nvim-lua/lsp-status.nvim'
    }
  },
  {
    'nvim-telescope/telescope.nvim', version = '0.1.1',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    cond = NotWindows,
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      {'folke/neodev.nvim',opts = {}}
    }
  },
  {
    'kevinhwang91/nvim-ufo',
    cond = NotWindows,
    dependencies = {
      'kevinhwang91/promise-async'
    }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    cond = NotWindows,
    build = ":TSUpadate",
    config = function () require'nvim-treesitter.configs'.setup({
      ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "odin" },
      modules = {},
      ignore_install = {},
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = {
          "make"
        },
      },
    }) end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    cond = NotWindows,
    config = function () require'treesitter-context'.setup({
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 3,
      trim_scope = 'outer',
      mode = 'topline',
      zindex = 0,
      enable = true,
      max_lines = 5,
    }) end
  }
})

