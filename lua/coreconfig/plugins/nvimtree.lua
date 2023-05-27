vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_respect_buf_cwd = 1

require("nvim-tree").setup({
  view = {
    adaptive_size = true
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})

vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>')
