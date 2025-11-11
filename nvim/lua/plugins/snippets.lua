-- snippets plugin: LuaSnip + friendly-snippets
return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local ok, luasnip = pcall(require, "luasnip")
      if not ok then
        return
      end

      -- load VSCode-style snippets from installed friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- load local Lua snippets from lua/snippets/
      require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/lua/snippets" })

      -- simple keymaps for expanding/jumping snippets (insert and select modes)
      vim.keymap.set({"i", "s"}, "<C-l>", function()
        if require("luasnip").expand_or_jumpable() then
          require("luasnip").expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({"i", "s"}, "<C-h>", function()
        if require("luasnip").jumpable(-1) then
          require("luasnip").jump(-1)
        end
      end, { silent = true })
    end,
  },
}
