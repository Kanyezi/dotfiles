-- 自动命令配置
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 保存前自动格式化
autocmd('BufWritePre', {
  callback = function()
    vim.lsp.buf.format()
  end,
  pattern = '*',
})

-- 复制高亮提示
autocmd('TextYankPost', {
  desc = 'highlight copying text',
  group = augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})

-- 延迟加载 gruvbox 主题
autocmd("VimEnter", {
  once = true,
  group = augroup('colorscheme', { clear = true }),
  callback = function()
    vim.cmd("colorscheme gruvbox")
  end,
})