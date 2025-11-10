-- 快捷键配置
local keymap = vim.keymap.set

-- 格式化
keymap('n', '<leader>lf', function()
  vim.lsp.buf.format()
end, { desc = 'format' })

-- 系统剪贴板
keymap({ 'n', 'v' }, '<leader>c', '"+y', { desc = 'copy to system clipboard' })
keymap({ 'n', 'v' }, '<leader>x', '"+d', { desc = 'cut to system clipboard' })
keymap({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'paste to system clipboard' })

-- 撤销
keymap({ 'n', 'v', 'i' }, '<C-z>', '<ESC>u<CR>', { desc = 'undo' })

-- 窗口切换
keymap('n', '<leader>ww', '<C-w>w', { desc = 'focus windows' })

-- 行移动
keymap('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
keymap('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- 调整窗口大小
keymap('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
keymap('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
keymap('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
keymap('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- 文件/插件快捷键
keymap({ 'n', 'i', 'v' }, '<C-s>', '<ESC>:write<CR>', { desc = 'save file' })
keymap('n', '<leader>e', ':lua MiniFiles.open()<CR>', { desc = 'open file explorer' })
keymap('n', '<leader>f', ':Pick files<CR>', { desc = 'open file picker' })
keymap('n', '<leader>h', ':Pick help<CR>', { desc = 'open help picker' })
keymap('n', '<leader>b', ':Pick buffers<CR>', { desc = 'open buffer picker' })
keymap('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'diagnostic messages' })

-- LSP 快捷键
keymap('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
keymap('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
keymap('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
keymap('n', 'gr', vim.lsp.buf.references, { desc = 'Find references' })
keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP code action' })

-- 快速跳转诊断
keymap('n', '[d', function()
  vim.diagnostic.jump({ wrap = true, count = -1 })
end, { desc = 'prev diagnostic' })
keymap('n', ']d', function()
  vim.diagnostic.jump({ wrap = true, count = 1 })
end, { desc = 'next diagnostic' })