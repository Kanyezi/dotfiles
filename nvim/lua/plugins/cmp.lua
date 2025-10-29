-- ~/.config/nvim/lua/plugins/cmp.lua

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP来源
    "hrsh7th/cmp-buffer",   -- 缓冲区词语
    "hrsh7th/cmp-path",     -- 文件路径
    "hrsh7th/cmp-cmdline",  -- 命令行
    "L3MON4D3/LuaSnip",     -- 代码片段引擎
    "saadparwaiz1/cmp_luasnip", -- 代码片段补全来源
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 回车确认补全
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
