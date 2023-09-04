if vim.g.neovide then
  require("gui")
end

function NotWindows()
    if vim.loop.os_uname().sysname == "Windows" then
      return false
    end
    return true
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
require("plugins.telescope")

