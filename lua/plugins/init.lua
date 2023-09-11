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
  'lervag/vimtex',
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  'AlexvZyl/nordic.nvim',
  'Mofiqul/dracula.nvim',
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
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function() require('dashboard').setup({
      theme = "doom",
      config = {
        header = Core.title,
        center = {
          {
            icon = '󰈔 ',
            icon_hl = 'Title',
            desc = 'New File                ',
            desc_hl = 'String',
            key = 'n',
            keymap = '\':e\'',
            key_hl = 'Number',
            action = function() NewFile() end
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'New Note                ',
            desc_hl = 'String',
            key = 'N',
            keymap = '',
            key_hl = 'Number',
            action = function() NewNote() end
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Search Notes            ',
            desc_hl = 'String',
            key = 's',
            keymap = '',
            key_hl = 'Number',
            action = function() SearchNotes() end
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Find File               ',
            desc_hl = 'String',
            key = 'o',
            keymap = '\' ff\'',
            key_hl = 'Number',
            action = require('telescope.builtin').find_files
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Config Files            ',
            desc_hl = 'String',
            key = 'c',
            keymap = '',
            key_hl = 'Number',
            action = function() Config_files() end
          },
          {
            icon = '󰚰 ',
            icon_hl = 'Title',
            desc = 'Update Plugins          ',
            desc_hl = 'String',
            key = 'u',
            keymap = '\' lu\'',
            key_hl = 'Number',
            action = function () require('lazy').update() end
          },
          {
            icon = '󰩈 ',
            icon_hl = 'Title',
            desc = 'Quit                    ',
            desc_hl = 'String',
            key = 'q',
            keymap = '\':q\'',
            key_hl = 'Number',
            action = ':q'
          },
        },
        footer = {
          " ",
          " ", -- top padding
          Footer()
        }
      }
      -- config
    })
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function() require'lualine'.setup{
      options = {
        theme = Core.theme,
        icons_enabled = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          {
            'filename',
            cond = NoLsp
          },
          {
            'require("lspsaga.symbol.winbar").get_bar()',
            cond = HasLsp
          },

          "require'lsp-status'.status()"},
        }
      }
      end,
    dependencies = {
      'nvim-lua/lsp-status.nvim'
    }
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-live-grep-args.nvim',
        version = "^1.0.0"
      }
    },
    config = function ()
      require('telescope').load_extension('live_grep_args')
      require('telescope').setup({

      pickers = {
        find_files = {
          mappings = {
            n = {
              ["cd"] = function(prompt_bufnr)
                local selection = require("telescope.actions.state").get_selected_entry()
                local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                require("telescope.actions").close(prompt_bufnr)
                -- Depending on what you want put `cd`, `lcd`, `tcd`
                vim.cmd(string.format("silent cd %s", dir))
              end
            }
          }
        },
      }
    }) end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    --cond = NotWindows,
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
    'nvimdev/lspsaga.nvim',
    --cond = NotWindows,
    config = function()
        require('lspsaga').setup({
            symbol_in_winbar = {
              enable = false
            }
        })
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    --cond = NotWindows,
    dependencies = {
      'kevinhwang91/promise-async'
    }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    cond = HasCCompiler,
    build = ":TSUpdate",
    config = function () require'nvim-treesitter.configs'.setup({
      ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "odin", "markdown", "markdown_inline" },
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
    enabled = false,
    config = function () require'treesitter-context'.setup({
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = 'outer',
      mode = 'cursor',
      zindex = 20,
      enable = true,
      max_lines = 5,
    }) end
  }
})

