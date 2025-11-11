--配置文件侧边栏
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    require("nvim-tree").setup {
      -- 你的配置选项
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
    }
  end,
}