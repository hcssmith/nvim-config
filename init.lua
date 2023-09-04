if vim.g.neovide then
  require("gui")
end
-- keymappings must be first due to mapleader apparently
require("keymappings")
require("plugins")
require("settings")
require("plugins.lsp")
require("plugins.nvimtree")
require("plugins.telescope")
require("plugins.treesitter-context")
require("plugins.ufo")

