-- ~/.config/nvim/lua/plugins/which-key.lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    position = "bottom-right", -- 右下角
    win = {
      border    = "rounded",
      title     = true,
      title_pos = "center",
    },
    delay = function(ctx)
      return ctx.plugin and 0 or 300
    end,
    preset = "modern",
    spec = {
      { "<leader>b", group = "缓冲区" },
      { "<leader>c", group = "剪贴板" },
      { "<leader>f", group = "文件/查找" },
      { "<leader>g", group = "Git" },
      { "<leader>w", group = "窗口" },
      { "<leader>q", group = "退出/会话" },
    },
  },
  config = function(_, opts)
    require("which-key").setup(opts)
  end,
}