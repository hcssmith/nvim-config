vim.o.termguicolors = true
vim.cmd.colorscheme(Core.theme)

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = Core.tabwidth
vim.opt.softtabstop = Core.tabwidth
vim.opt.shiftwidth = Core.tabwidth
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.textwidth = Core.textwidth

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.cmd.set("splitbelow")
vim.cmd.set("splitright")

vim.opt.swapfile = false
vim.opt.backupdir = os.getenv(Core.Home) .. "/.vim/backupdir"
vim.opt.undodir = os.getenv(Core.Home) .. "/.vim/undodir"
vim.opt.undofile = true


vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
