-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "bash", "python" }, -- 确保安装的语言解析器
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true, -- 启用增强语法高亮
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
