return {
  -- nvim-cmp
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
    },
    opts = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      local tab = function(fallback)
        if cmp.visible() then
          local e = cmp.get_selected_entry()
          if not e then
            cmp.select_next_item()
          elseif e.source.name == 'luasnip' then
            cmp.confirm({ select = true })
            vim.schedule(function() luasnip.jump(1) end)
          else
            cmp.select_next_item()
          end
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end

      local stab = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end

      return {
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>']     = cmp.mapping.scroll_docs(-4),
          ['<C-f>']     = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>']     = cmp.mapping.abort(),
          ['<CR>']      = cmp.mapping.confirm({ select = true }),
          ['<Tab>']     = cmp.mapping(tab,   { 'i', 's' }),
          ['<S-Tab>']   = cmp.mapping(stab,  { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip'  },
        }, {
          { name = 'buffer' },
          { name = 'path'   },
        }),
      }
    end,
    config = function(_, opts)
      local cmp = require('cmp')
      cmp.setup(opts)
      cmp.setup.cmdline(':', { sources = { { name = 'cmdline' } } })
    end,
  },

  -- LuaSnip
  {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    opts = {
      history = true,
      updateevents = 'TextChanged,TextChangedI',
    },
    config = function(_, opts)
      require('luasnip').setup(opts)
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
}