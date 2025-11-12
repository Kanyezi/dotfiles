-- ~/.config/nvim/lua/config/keymaps.lua
local keymap = vim.keymap.set

-- 系统剪贴板
keymap({ 'n', 'v' }, '<leader>c', '"+y', { desc = '复制到系统剪贴板' })
keymap({ 'n', 'v' }, '<leader>x', '"+d', { desc = '剪切到系统剪贴板' })
keymap({ 'n', 'v' }, '<leader>p', '"+p', { desc = '从系统剪贴板粘贴' })

-- 撤销
keymap({ 'n', 'v', 'i' }, '<C-z>', '<Esc>u', { desc = '撤销' })

-- 窗口跳转（Ctrl + h/j/k/l）
keymap('n', '<C-h>', '<C-w>h', { desc = '跳到左侧窗口' })
keymap('n', '<C-j>', '<C-w>j', { desc = '跳到下方窗口' })
keymap('n', '<C-k>', '<C-w>k', { desc = '跳到上方窗口' })
keymap('n', '<C-l>', '<C-w>l', { desc = '跳到右侧窗口' })

-- 窗口焦点 / 大小调整
keymap('n', '<leader>ww', '<C-w>w', { desc = '循环切换窗口' })
keymap('n', '<C-Up>',    ':resize +2<CR>',          { desc = '增加窗口高度' })
keymap('n', '<C-Down>',  ':resize -2<CR>',          { desc = '减少窗口高度' })
keymap('n', '<C-Left>',  ':vertical resize -2<CR>', { desc = '减少窗口宽度' })
keymap('n', '<C-Right>', ':vertical resize +2<CR>', { desc = '增加窗口宽度' })

-- 行移动
keymap('n', '<A-j>', ':m .+1<CR>==', { desc = '下移当前行' })
keymap('n', '<A-k>', ':m .-2<CR>==', { desc = '上移当前行' })
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = '下移选中行' })
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = '上移选中行' })