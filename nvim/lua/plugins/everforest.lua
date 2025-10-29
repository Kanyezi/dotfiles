return {
  'neanias/everforest-nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('everforest').setup({
      background = 'hard',      -- soft / medium / hard
      italic_comments = true,
    })
    vim.cmd.colorscheme('everforest')
  end
}