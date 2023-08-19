require("coreconfig.packer")

require("coreconfig.bindings")

require("coreconfig.settings")

require("coreconfig.plugins.nvimtree")

require("coreconfig.plugins.lsp")


require("coreconfig.plugins.telescope")

require("coreconfig.plugins.ufo")

if vim.g.neovide then
  require("coreconfig.gui")
end
