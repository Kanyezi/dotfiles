--配置mason 插件
return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup({
      ensure_installed = { "lua_ls", "pyright", "tsserver", "gopls", "rust_analyzer", "bashls", "html", "cssls", "jsonls", "yamlls", "dockerls", "vimlls", "python-debug-adapter", "js-debug-adapter", "stylua", "black", "prettier", "shfmt", "flake8", "eslint_d" }
    })
  end,
}
