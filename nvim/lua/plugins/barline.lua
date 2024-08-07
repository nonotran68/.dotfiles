return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    animation = true,
    clickable = true,
    tabpages = true,
    -- insert_at_start = true,
    -- …etc.  -- Set the filetypes which barbar will offset itself for
    sidebar_filetypes = {
      -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
      NvimTree = true,
    },
  },
}
