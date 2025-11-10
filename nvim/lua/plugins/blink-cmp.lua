-- Blink-cmp 补全配置
require('blink.cmp').setup({
  keymap = { preset = 'super-tab' },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
})