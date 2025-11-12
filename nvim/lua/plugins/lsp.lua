  return{
    "neovim/nvim-lspconfig",
    event = "VeryLazy", -- 等用户第一次用映射才加载
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- 1. 诊断样式
      vim.diagnostic.config({
        virtual_text = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = { border = "rounded", source = "always" },
      })

      -- 2. 统一 capabilities（补全/图标）
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- 3. 通用 on_attach（一次性给三大语言用）
      local on_attach = function(_, bufnr)
        -- 本地函数：只当前 buffer 生效
        local bufmap = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        -- 导航
        bufmap("n", "gd", vim.lsp.buf.definition, "转到定义")
        bufmap("n", "gD", vim.lsp.buf.declaration, "转到声明")
        bufmap("n", "gi", vim.lsp.buf.implementation, "转到实现")
        bufmap("n", "gr", vim.lsp.buf.references, "查找引用")
        -- 代码动作
        bufmap("n", "<leader>rn", vim.lsp.buf.rename, "重命名符号")
        bufmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "代码动作")
        -- 格式化
        bufmap("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "格式化缓冲区")
        -- 诊断跳转
        bufmap("n", "[d", function() vim.diagnostic.jump({ count = -1, wrap = true }) end, "上一诊断")
        bufmap("n", "]d", function() vim.diagnostic.jump({ count = 1, wrap = true }) end, "下一诊断")
        -- 悬停文档
        bufmap("n", "K", vim.lsp.buf.hover, "悬停文档")
      end

      -- 4. 语言服务器通用设置
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
              diagnostics = { globals = { "vim" } },
              workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
              format = { enable = true },
            },
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        clangd = {
          cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
          root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
        },
      }

      -- 5. 一次性注册 + 启用
      for name, cfg in pairs(servers) do
        cfg.capabilities = capabilities
        cfg.on_attach = on_attach
        vim.lsp.config(name, cfg)
      end
      vim.lsp.enable(vim.tbl_keys(servers))
    end,
}