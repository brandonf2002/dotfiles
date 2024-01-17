-- Use alt + hjkl to resize windows
vim.keymap.set('n', '<M-j>', ':resize -2<CR>', { noremap = true })
vim.keymap.set('n', '<M-k>', ':resize +2<CR>', { noremap = true })
vim.keymap.set('n', '<M-h>', ':vertical resize -2<CR>', { noremap = true })
vim.keymap.set('n', '<M-l>', ':vertical resize +2<CR>', { noremap = true })

-- TAB/Shift-TAB in noraml mode will move to next/previous buffer
vim.keymap.set('n', '<TAB>', ':bnext<CR>', { noremap = true })
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>', { noremap = true })

-- Remap leader h to unhighlight text
vim.keymap.set('n', '<leader>h', ':noh<CR>', { noremap = true, silent = true })

-- Shortcuts to create splits and vertical splits
vim.keymap.set('n', '<leader>s', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ns', ':split<CR>:enew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>nv', ':vsplit<CR>:enew<CR>', { noremap = true, silent = true })

-- Tab shortcuts
vim.keymap.set('n', '<leader>t', ':tabnew %<CR>', { noremap = true, silent = true })

-- Search and replace current word
vim.keymap.set('n', '<leader>*', ':%s/<c-r><c-w>//g<left><left>', { noremap = true })

-- Better tab navigation
vim.keymap.set('n', '<leader>1', '1gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>2', '2gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>3', '3gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>4', '4gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>5', '5gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>6', '6gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>7', '7gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>8', '8gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>9', '9gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>0', '0gt', { noremap = true, silent = true })

-- Just to add a semi colon at the end and go back to the same place
vim.keymap.set('n', '<leader>;', 'msA;<ESC>`s', { noremap = true, silent = true })

-- Centre the screen when searching forward and backwards
vim.keymap.set('n', 'n', 'nzz', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true, silent = true })
vim.keymap.set('v', 'n', 'nzz', { noremap = true, silent = true })
vim.keymap.set('v', 'N', 'Nzz', { noremap = true, silent = true })

-- jk and kj to leave insert mode
vim.keymap.set('i', 'jk', '<esc>', { noremap = true, silent = true })
vim.keymap.set('i', 'kj', '<esc>', { noremap = true, silent = true })

-- Add comments
vim.keymap.set('n', '<leader>cf', 'O/**<CR><CR><esc>a/<up> @brief ', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cs', 'O/**<CR><CR><esc>a/<up> ', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cm', 'A /*!<  */<left><left><left>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ii', 'i#ifdef __cplusplus<CR>extern "C" {<CR>#endif<CR><CR>#pragma once<CR><CR>#include <stdint.h><CR>#include <stdbool.h><CR><CR>#include "esp_err.h"<CR>#include "esp_log.h"<CR><CR>#ifdef __cplusplus<CR>}<CR>#endif<esc>3ko<CR><esc>k', { noremap = true, silent = true })

-- Surround visual selection with DEBUG ifdef
vim.keymap.set('v', 'gd', 'c#ifdef DEBUG<esc>o#endif<esc>P', { noremap = true, silent = true })

-- Move hightlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- yank into and from system keyboard
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set({"n", "v"}, "<leader>p", "\"+p")
vim.keymap.set({"n", "v"}, "<leader>P", "\"+P")
