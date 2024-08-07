return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  opts = {
    -- your options... For example:
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
      vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
    end,
    attach_mode = 'global',
    backends = { 'lsp', 'markdown', 'treesitter', 'man' },
    show_guides = true,
    link_folds_to_tree = true,
    filter_kind = false,
  },
  keys = {
    { '<leader>tt', '<cmd>AerialToggle<cr>', desc = 'Toggle Aerial' },
    -- etc.
  },
}
