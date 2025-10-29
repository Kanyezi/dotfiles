-- ~/.config/nvim/init.lua

-- 设置一个Leader键，这里设为空格键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 导入核心配置
require("core.options")

-- 导入并配置插件
require("plugins-setup")
