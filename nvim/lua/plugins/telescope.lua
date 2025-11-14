return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- 1. 扩展本体
    { "nvim-telescope/telescope-project.nvim", lazy = true },
  },
  config = function()
    -- 2. 加载扩展
    require("telescope").load_extension "project"
  end,
}