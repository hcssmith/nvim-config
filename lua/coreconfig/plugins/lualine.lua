require'lualine'.setup{
	options = {
    theme = 'tokyonight',
    icons_enabled = true,
  },
	sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_c = {
      'data',
      "require'lsp-status'.status()" }
	}
}
