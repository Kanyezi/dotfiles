return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 配置 clangd (C/C++)
      vim.lsp.config('clangd', {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- 为 LSP 挂载快捷键
          local opts = { buffer = bufnr, noremap = true, silent = true }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })

      -- 启用 clangd
      vim.lsp.enable('clangd')

      -- 你可以在这里添加其他语言的服务器配置
      -- 例如 Python 的 pyright：
      -- vim.lsp.config('pyright', { capabilities = capabilities })
      -- vim.lsp.enable('pyright')
    end,
  },
}
