require("coreconfig.packer")

require("coreconfig.bindings")

require("coreconfig.settings")

require("coreconfig.plugins.nvimtree")

require("coreconfig.plugins.tokyonight")

require("coreconfig.plugins.neodev")
require("coreconfig.plugins.lsp")


require("coreconfig.plugins.lualine")

require("coreconfig.plugins.treesitter")

--require("coreconfig.plugins.gitsigns")

require("coreconfig.plugins.telescope")

if vim.g.neovide then
  require("coreconfig.gui")
end
