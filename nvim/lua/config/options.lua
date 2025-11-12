-- Neovim 基础设置
vim.opt.number = true                           -- 显示行号
vim.opt.relativenumber = true                   -- 显示相对行号
vim.opt.cursorline = true                       -- 高亮光标所在行
vim.opt.expandtab = true                        -- 使用空格代替 Tab
vim.opt.tabstop = 4                             -- Tab 键宽度为 2
vim.opt.shiftwidth = 4                          -- 缩进宽度为 2
vim.opt.wrap = false                            -- 不自动换行
vim.opt.scrolloff = 0                           -- 上下保留 5 行作为缓冲
vim.opt.signcolumn = 'yes'                      -- 永远显示 sign column（诊断标记）
vim.opt.ignorecase = true                       -- 搜索忽略大小写
vim.opt.smartcase = true                        -- 当包含大写字母时，搜索区分大小写
vim.opt.hlsearch = false                        -- 搜索匹配不高亮
vim.opt.incsearch = true                        -- 增量搜索
vim.opt.foldmethod = 'expr'                     -- 折叠方式使用表达式
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()' -- 使用 Treesitter 表达式折叠
vim.opt.foldlevel = 99                          -- 打开文件时默认不折叠
vim.g.mapleader = ' '                           -- 设置 leader 键为空格
-- 默认复制到系统剪贴板
vim.opt.clipboard:append("unnamedplus")

vim.cmd.colorscheme 'everforest'