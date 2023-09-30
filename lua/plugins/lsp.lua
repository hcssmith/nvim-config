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

lsp.on_attach(function(client, bufnr)
  Set_keymaps(Core.Keybindings.Lsp, bufnr)
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
