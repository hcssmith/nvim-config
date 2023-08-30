-- First setup / install all plugins
require("plugins")

-- set font in neovide
if vim.g.neovide then
  require("gui")
end

-- global settings
require("settings")

-- keymappings
require("keymappings")

-- configure relevant plugins
require("plugins.lsp")
require("plugins.nvimtree")
require("plugins.telescope")
require("plugins.treesitter-context")
require("plugins.ufo")

