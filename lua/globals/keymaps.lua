local lsp_opts = {remap = false}


Core.Keybindings = {
  General =  {
    insert = {
      {"jk", "<Esc>"}
    },
    normal = {
      {"<C-h>", "<C-W><C-h>"},
      {"<C-j>", "<C-W><C-j>"},
      {"<C-k>", "<C-W><C-k>"},
      {"<C-l>", "<C-W><C-l>"},
      {"<C-Left>", "<C-W><C-h>"},
      {"<C-Down>", "<C-W><C-j>"},
      {"<C-Up>", "<C-W><C-k>"},
      {"<C-Right>", "<C-W><C-l>"},
      {"Q", "<nop>"}
    }
  },
  Neorg = {
    normal = {
      {"<localleader>nd", ":Neorg keybind norg core.qol.todo_items.todo.task_done<CR>"},
      {"<localleader>nc", ":Neorg keybind norg core.qol.todo_items.todo.task_cycle<CR>"},
      {"<localleader>nh", ":Neorg keybind norg core.qol.todo_items.todo.task_on_hold<CR>"},
      {"<localleader>nr", ":Neorg keybind norg core.qol.todo_items.todo.task_recurring<CR>"},
      {"<localleader>lt", ":Neorg keybind norg core.pivot.toggle-list-type<CR>"}
    }
  },
  Dashboard = {
    normal = {
      {'<leader>db', function () LaunchDashboard() end}
    }
  },
  Lazy = {
    normal = {
      {"<leader>lu",function() require('lazy').update() end}
    }
  },
  Lsp = {
    normal = {
      {"gd", vim.lsp.buf.definition,lsp_opts},
      {"<leader>vws", vim.lsp.buf.workspace_symbol, lsp_opts},
      {"<leader>vd", vim.diagnostic.open_float, lsp_opts},
      {"[d", vim.diagnostic.goto_next, lsp_opts},
      {"]d", vim.diagnostic.goto_prev, lsp_opts},
      {"<leader>vca", vim.lsp.buf.code_action, lsp_opts},
      {"<leader>vrr", vim.lsp.buf.references, lsp_opts},
      {"<leader>vrn", vim.lsp.buf.rename, lsp_opts},
      {"<leader>pd", ":Lspsaga peek_definition<CR>", lsp_opts},
      {"<leader>ca", ":Lspsaga code_action<CR>", lsp_opts},
      {"<leader>o", ":Lspsaga outline<CR>", lsp_opts},
      {"K", ":Lspsaga hover_doc<CR>", lsp_opts}
    },
    insert = {
      {"<C-h>", vim.lsp.buf.signature_help, lsp_opts}
    }
  },
  Tree = {
    normal = {
      {'<leader>e', ':NvimTreeFindFileToggle<CR>'}
    }
  },
  Ufo = {
    normal = {
      {'zR', function () require('ufo').openAllFolds() end},
      {'zM', function () require('ufo').closeAllFolds() end}
    }
  },
  Telescope = {
    normal = {
      {'<leader>ff', function () require('telescope.builtin').find_files() end},
      {'<leader>fb', function () require('telescope.builtin').buffers() end},
      {'<leader>gf', function () require('telescope.builtin').git_files() end},
      {'<leader>ps', function () require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) end },
      {'<leader>vh', function () require('telescope.builtin').help_tags() end}
    }
  },
  TreeSitterContext = {
    normal = {
      {'<leader>gc', function() require("treesitter-context").go_to_context() end, { silent = true }}
    }
  },
  MarkdownPreview = {
    normal = {
      {"<leader>pv", ":MarkdownPreviewToggle<CR>"}
    }
  }
}
