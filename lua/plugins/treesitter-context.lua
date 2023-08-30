vim.keymap.set("n", "<leader>gc", function()
  require("treesitter-context").go_to_context()
end, { silent = true })
