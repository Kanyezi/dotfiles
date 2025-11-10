-- Treesitter 配置
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'python', 'json', 'vim', 'markdown', 'c' }, -- 安装的语言
  highlight = { enable = true },                                          -- 语法高亮
  indent = { enable = true },                                             -- 缩进
})