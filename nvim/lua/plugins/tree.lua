return {
  -- ① 文件树
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeOpen" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "切换文件树" },
    },
    opts = {
      view = { width = 30, side = "left" },
      renderer = {
        icons = {
          show = {
            git = true, folder = true, file = true, folder_arrow = true,
          },
        },
      },
      filters = { dotfiles = false },
    },
  }
}