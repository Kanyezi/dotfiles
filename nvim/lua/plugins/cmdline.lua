-- 安装'VonHeikemen/fine-cmdline.nvim' 立即加载的
return {
  "VonHeikemen/fine-cmdline.nvim",
  config = function()
    require("fine-cmdline").setup({
      cmdline = {
        position = {
          row = "50%",
          col = "50%",
        },
        size = {
          width = 60,
          height = 1,
        },
      },
    })
  end,
}