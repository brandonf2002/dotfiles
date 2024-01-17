vim.g.mapleader = " "
vim.g.python_highlight_space_errors = 0

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hidden = true
vim.opt.mouse='a'
vim.opt.ruler = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cmdheight=1
vim.opt.smarttab = true
-- vim.opt.clipboard='unnamedplus'
vim.opt.conceallevel = 0
vim.opt.showtabline = 2
vim.opt.updatetime = 300
vim.opt.pumheight = 10
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.cursorline = true

vim.cmd('syntax enable')
vim.cmd('autocmd BufEnter *.asm setfiletype nasm')

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.cmd(':setlocal spell spelllang=en_gb')
