-- Global variables, large strings or 
-- things that are refeneced in multiple places
require("globals")
require("globals.keymaps")
-- Various utility functions (search funcs , feature / os checks
require("functions.util")
require("functions.util.cond")

-- Conditional globals
require("globals.cond")

-- If is a Gui include gui only setup, 
-- neovide / nvy supported currently add test
-- in Gui function within function.util
if Gui then
  require("gui")
end

-- keymappings must be first due to mapleader apparently
require("keymappings")
-- plugins config
require("plugins")

-- base neovim settings (indent / backups / etc.)
require("settings")

-- lsp setup
require("plugins.lsp")
require("plugins.ufo")

-- Assorted other configs
require('plugins.markdown-preview')
require('plugins.nvimtree')

-- Setup all remaining keybinds from global config
require('plugins.keybinds')

