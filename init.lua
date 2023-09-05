require("functions.util")
require("globals")

if vim.g.neovide then
  require("gui")
end

-- keymappings must be first due to mapleader apparently
require("keymappings")
require("plugins")
require("settings")
if NotWindows then
  require("plugins.lsp")
  require("plugins.nvimtree")
  require("plugins.treesitter-context")
  require("plugins.ufo")
end
require('plugins.dashboard')
require("plugins.telescope")
require('preview')
