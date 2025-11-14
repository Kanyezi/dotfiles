-- ~/.config/nvim/lua/plugins/dashboard.lua
return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- ① 项目扩展（可选，没装就自动降级）
    { "nvim-telescope/telescope-project.nvim", lazy = true },
  },
  opts = function()
    local logo = {
      "",
      " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
      "",
    }
    logo = string.rep("\n", 8) .. table.concat(logo, "\n") .. "\n\n"

    ------------------------------------------------------------
    -- ② 按钮定义：全部用 Telescope 内置 picker，零 LazyVim
    ------------------------------------------------------------
    local buttons = {
      { icon = "󰍉 ", key = "f", desc = "Find File",         action = "Telescope find_files" },
      { icon = "󰈬 ", key = "g", desc = "Find Word",         action = "Telescope live_grep" },
      { icon = " ", key = "r", desc = "Recent Files",      action = "Telescope oldfiles" },
      { icon = " ", key = "p", desc = "Open Project",      action = function() -- ③ 项目入口
        -- 如果装了 telescope-project 就用它
        local ok = pcall(function()
          require("telescope").load_extension("project")
          vim.cmd("Telescope project")
        end)
        if not ok then
          -- 降级
          require("telescope.builtin").find_files({ cwd = "~/projects", prompt_title = "Select Project" })
        end
      end },
      { icon = " ", key = "c", desc = "Config",            action = "edit ~/.config/nvim/init.lua" },
      { icon = " ", key = "q", desc = "Quit",              action = "qa" },
    }

    -- 对齐宽度
    for _, btn in ipairs(buttons) do
      btn.desc = btn.desc .. string.rep(" ", 43 - #btn.desc)
      btn.key_format = "  %s"
    end

    return {
      theme = "doom",
      config = {
        header = vim.split(logo, "\n"),
        center = buttons,
      },
      hide = {
        statusline = false,
        tabline    = false,
        winbar     = false,
      },
    }
  end,

  ------------------------------------------------------------
  -- ④ setup + 快捷键
  ------------------------------------------------------------
  config = function(_, opts)
    require("dashboard").setup(opts)
    vim.keymap.set("n", "<leader>db", "<cmd>Dashboard<CR>", { desc = "Dashboard" })
  end,
}