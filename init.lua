-- Global variables, large strings or 
-- things that are refeneced in multiple places
require("globals")
-- Various utility functions (search funcs , feature / os checks
require("functions.util")

-- If is a Gui include gui only setup, 
-- neovide / nvy supported curreny add test
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
require('plugins.lazy')
-- Only inculde when not windows (problem getting C compiler in scope)
if NotWindows then
  require("plugins.nvimtree")
  --require("plugins.treesitter-context")
end

-- Assorted other configs
require('plugins.dashboard')
require("plugins.telescope")
require('plugins.markdown-preview')
require('preview')

