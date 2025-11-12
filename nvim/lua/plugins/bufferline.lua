-- ~/.config/nvim/lua/plugins/bufferline.lua
return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  keys = {
    { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",        desc = "上一个缓冲区" },
    { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",        desc = "下一个缓冲区" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>",        desc = "固定/取消固定" },
    { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "关闭未固定缓冲区" },
  },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      separator_style = "slant",
      offsets = {
        {
          filetype = "NvimTree",
          text = "文件树",
          highlight = "Directory",
          text_align = "left",
        },
      },
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    vim.keymap.set("n", "gb", "<cmd>BufferLinePick<cr>", { desc = "快速选择缓冲区" })
  end,
}