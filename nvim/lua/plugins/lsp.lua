--采用lazy的格式进行lsp配置 同时配置c++和python的lsp
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- LSP 配置
        vim.diagnostic.config({ virtual_text = true }) -- 行内文本提示
    
        -- Lua LSP 配置 (lua_ls)
        vim.lsp.config('lua_ls', {
        settings = {
            Lua = {
            runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') }, -- Lua 运行时
            diagnostics = { globals = { 'vim' } },                                 -- 忽略全局变量 vim 的警告
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            format = { enable = true }, -- 启用格式化
            },
        },
        })
    
        -- 启用 LSP
        vim.lsp.enable({ 'lua_ls', 'pyright', 'clangd' })
    end,
}