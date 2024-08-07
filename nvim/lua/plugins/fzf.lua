return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- calling `setup` is optional for customization
    require('fzf-lua').setup {
      { 'telescope', winopts = { preview = { default = 'bat' } } },
      grep = {
        -- enable glob parsing by default to all
        -- grep providers? (default:false)
        rg_glob = true,
        rg_opts = '--sort-files --hidden --column --line-number --no-heading '
          .. "--color=always --smart-case -g '!{.git,node_modules}/*'",
        glob_flag = '--iglob', -- for case sensitive globs use '--glob'
        glob_separator = '%s%-%-', -- query separator pattern (lua): ' --'
      },
      --Bind keymaps for Fzf here
      vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = '[F]zf [F]ind Files' }),
      vim.keymap.set('n', '<leader>fr', function()
        require('fzf-lua').grep { search = '' }
      end, { desc = '[F]zf G[r]ep String Search' }),
      vim.keymap.set(
        'n',
        '<leader>fR',
        '<Cmd>lua require("fzf-lua").grep({ resume = true })<CR>',
        { desc = '[Fzf] [R]esume Grep String Search' }
      ),
      vim.keymap.set('n', '<leader>fs', require('fzf-lua').live_grep, { desc = '[F]zf Live Grep String [S]earch' }),
      vim.keymap.set('n', '<F1>', require('fzf-lua').helptags, { desc = '[F]zf Helptags' }),
    }
  end,
}
