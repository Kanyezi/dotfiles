return{
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- 在真正加载前，设置一个空状态栏
      vim.o.statusline = " "
    else
      -- 在启动页面隐藏状态栏
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- 性能优化：重写require逻辑
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    -- 恢复之前保存的laststatus值
    vim.o.laststatus = vim.g.lualine_laststatus

    -- 自定义图标，你需要根据自己喜好定义这些图标
    local icons = {
      diagnostics = {
        Error = " ",
        Warn = " ",
        Info = " ",
        Hint = " ",
      },
      git = {
        added = " ",
        modified = " ",
        removed = " ",
      }
    }

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3, -- 只有当laststatus设为3时启用全局状态栏
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } }, -- 在这些界面禁用状态栏
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          -- 替换 LazyVim.lualine.root_dir(): 显示当前工作目录
          {
            function()
              return vim.fn.getcwd()
            end,
            icon = " ",
          },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          -- 替换 LazyVim.lualine.pretty_path(): 显示文件路径
          {
            "filename",
            path = 1, -- 0 = 仅文件名, 1 = 相对路径, 2 = 绝对路径
            symbols = { modified = "  ", readonly = "  " },
          },
        },
        lualine_x = {
          -- 移除 Snacks.profiler.status()
          -- 移除 noice 相关组件 (除非你配置了 noice.nvim)
          -- 移除 dap 状态组件 (除非你配置了 nvim-dap)
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R") -- 显示时间
          end,
        },
      },
      extensions = { "neo-tree", "lazy" }, -- 移除了 "fzf" 扩展（如果你不用的话）
    }
    return opts
  end,
}