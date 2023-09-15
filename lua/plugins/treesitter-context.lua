
Set_keymaps({normal = {
  {'<leader>gc', function() require("treesitter-context").go_to_context() end, { silent = true }}
}})
