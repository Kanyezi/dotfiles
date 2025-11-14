return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        -- 确保全局状态栏模式
        globalstatus = true,
        -- theme = "catppuccin",
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
      },
    })
  end,
}