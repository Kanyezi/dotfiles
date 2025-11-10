-- 插件管理配置
vim.pack.add({
  { src = 'https://github.com/morhetz/gruvbox' },       -- 主题
  { src = 'https://github.com/mason-org/mason.nvim' },  -- LSP 安装管理器
  { src = 'https://github.com/neovim/nvim-lspconfig' }, -- LSP 配置
  { src = 'https://github.com/nvim-mini/mini.pick' },   -- 文件/缓冲区选择器
  { src = 'https://github.com/nvim-mini/mini.files' },  -- 文件浏览器
})

-- Treesitter 安装并懒加载
vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' } -- 语法高亮和折叠
}, {
  load = function(plug_data)
    vim.api.nvim_create_autocmd("BufReadPre", {
      once = true,
      callback = function()
        vim.opt.runtimepath:append(plug_data.path)
        require('plugins.treesitter')
      end,
    })
  end
})

-- blink.cmp 安装补全配置以及触发加载
vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.*') },
}, {
  load = function(plug_data)
    vim.api.nvim_create_autocmd("InsertEnter", {
      once = true,
      callback = function()
        vim.opt.runtimepath:append(plug_data.path)
        require('plugins.blink-cmp')
      end,
    })
  end
})

-- 插件延迟加载（在读取文件或创建新文件时加载）
vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  callback = function()
    require('plugins.mason')
    require('plugins.mini')
  end,
})