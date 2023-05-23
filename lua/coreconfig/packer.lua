vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
  use 'vim-crystal/vim-crystal'
  use 'caglartoklu/borlandp.vim'
end)
