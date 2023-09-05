vim.o.termguicolors = true
vim.cmd.colorscheme(Core.theme)

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.cmd.set("splitbelow")
vim.cmd.set("splitright")

vim.opt.swapfile = false
vim.opt.backupdir = os.getenv("HOME") .. "/.vim/backupdir"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
