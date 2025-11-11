--安装catppucin主题
return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = true,
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        lsp_trouble = true,
        cmp = true,
        gitsigns = true,
        telescope = true,
        nvimtree = true,
        which_key = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        dashboard = true,
        neogit = true,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = true,
        markdown = true,
        lightspeed = false,
        ts_rainbow = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}