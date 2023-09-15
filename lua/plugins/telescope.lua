local builtin = require('telescope.builtin')

local keymaps = {
  normal = {
    {'<leader>ff', builtin.find_files},
    {'<leader>fb', builtin.buffers},
    {'<leader>gf', builtin.git_files},
    {'<leader>ps', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end },
    {'<leader>vh', builtin.help_tags}
  }
}

Set_keymaps(keymaps)

