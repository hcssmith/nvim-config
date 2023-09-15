local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'lua_ls',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Enter>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})


-- disable completion with tab
-- this helps with copilot setup
--cmp_mappings['<Tab>'] = nil
--cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})
local opts = {buffer = bufnr, remap = false}
local keymaps = {
  normal = {
    {"gd", vim.lsp.buf.definition,opts},
    {"<leader>vws", vim.lsp.buf.workspace_symbol, opts},
    {"<leader>vd", vim.diagnostic.open_float, opts},
    {"[d", vim.diagnostic.goto_next, opts},
    {"]d", vim.diagnostic.goto_prev, opts},
    {"<leader>vca", vim.lsp.buf.code_action, opts},
    {"<leader>vrr", vim.lsp.buf.references, opts},
    {"<leader>vrn", vim.lsp.buf.rename, opts},
    {"<leader>pd", ":Lspsaga peek_definition<CR>", opts},
    {"<leader>ca", ":Lspsaga code_action<CR>", opts},
    {"<leader>o", ":Lspsaga outline<CR>", opts},
    {"K", ":Lspsaga hover_doc<CR>", opts}
  },
  insert = {
    {"<C-h>", vim.lsp.buf.signature_help, opts}
  }
}

lsp.on_attach(function(client, bufnr)
  Set_keymaps(keymaps)
  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

local lspconfig = require('lspconfig')

-- example to setup lua_ls and enable call snippets
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      },
      workspace = {
        checkThirdParty = false,
      },
    }
  }
})
