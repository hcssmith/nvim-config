function SetupNeorgBindings()
  vim.api.nvim_create_autocmd('FileType', {
	  desc = 'Setup neorg keybinds in neorg buffer only',
	  pattern = 'norg',
	  callback = function ()
      SetKeymaps(Core.Keybindings.Neorg, 0)
   end
  })
end


