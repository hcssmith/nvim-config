local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  use {
    'lewis6991/gitsigns.nvim',
    config = function () require('gitsigns').setup() end
  }
  use 'AlexvZyl/nordic.nvim'

  use {
    'folke/tokyonight.nvim',
    config = function() require('tokyonight').setup({
      style = 'storm'
    }) end
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      {'nvim-tree/nvim-web-devicons'},
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
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = function() require'lualine'.setup{
      options = {
        theme = 'nordic',
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
      requires = {
        {'nvim-lua/lsp-status.nvim'},
      }
    }

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = {
        {'nvim-lua/plenary.nvim'},
      },
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
          config = function () require("neodev").setup({}) end
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
      config = function () require'nvim-treesitter.configs'.setup {
        ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "odin" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      } end
    }

    use {
      'nvim-treesitter/nvim-treesitter-context',
      config = function () require'treesitter-context'.setup({
        enable = true,
        max_lines = 5,
      }) end
    }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
