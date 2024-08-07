-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set Terminal mode always open in terminal (insert) mode
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  command = 'startinsert',
})

-- TODO: temporarily not working
-- vim.api.nvim_create_autocmd('FileType', {
--   group = vim.api.nvim_create_augroup('win-fix-buf', { clear = true }),
--   pattern = 'aerial',
--   desc = 'Disallow changing buf',
--   callback = function()
--     if vim.fn.exists '&winfixbuf' == 1 then
--       vim.wo.winfixbuf = true
--     end
--   end,
-- })

-- NOTE:: deprecated autocmds
--
-- Create keymaps to compile and run depend on filetypes. Work only on UNIX
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNew' }, {
--   group = vim.api.nvim_create_augroup('compile-and-run', { clear = true }),
--   pattern = '*',
--   callback = function()
--     local file_type = vim.bo.filetype
--     -- For Python
--     if file_type == 'python' then
--       vim.keymap.set(
--         'n',
--         '<leader>cc',
--         '<Cmd>w | botright vsplit | terminal python %<CR>',
--         { silent = true, desc = 'Python Compile and Run!' }
--       )
--     elseif file_type == 'lua' then
--       vim.keymap.set(
--         'n',
--         '<leader>cc',
--         '<Cmd>w | botright vsplit | terminal lua %<CR>',
--         { silent = true, desc = 'Lua Compile and Run!' }
--       )
--       -- For GCC
--     elseif file_type == 'cpp' then
--       vim.keymap.set(
--         'n',
--         '<leader>cc',
--         '<Cmd>w | botright vsplit | terminal g++ -Wall % -o %:r.out && /usr/bin/time ./%:r.out<CR>',
--         { silent = true, desc = 'CPP Compile and Run!' }
--       )
--     elseif file_type == 'c' then
--       vim.keymap.set('n', '<leader>cc', function()
--         print 'C!'
--       end, { desc = 'cpp' })
--     else
--       vim.keymap.set('n', '<leader>cc', function()
--         print 'Unknown filetype, mapping not defined.'
--       end, { desc = 'Undefined mapping' })
--     end
--   end,
-- })
