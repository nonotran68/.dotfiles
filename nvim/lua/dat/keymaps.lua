-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

--Disable uncomfortable q: keybind
vim.keymap.set('n', 'q:', '<nop>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Moving block code in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Move to previous/next
vim.keymap.set(
  'n',
  '<A-left>',
  '<Cmd>BufferPrevious<CR>',
  { desc = 'Move to previous buffer', noremap = true, silent = true }
)
vim.keymap.set('n', '<A-right>', '<Cmd>BufferNext<CR>', { desc = 'Move to next buffer', noremap = true, silent = true })
-- Re-order to previous/next
vim.keymap.set(
  'n',
  '<A-S-left>',
  '<Cmd>BufferMovePrevious<CR>',
  { desc = 'Reorder to previous buffer', noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<A-S-right>',
  '<Cmd>BufferMoveNext<CR>',
  { desc = 'Reorder to next buffer', noremap = true, silent = true }
)
vim.keymap.set('n', '<A-w>', function()
  vim.cmd.BufferClose()
end, { desc = 'Close buffer', noremap = true, silent = true })

vim.keymap.set('n', '<A-o>', function()
  vim.cmd.new()
  vim.cmd.close()
end, { desc = 'Open buffer', noremap = true, silent = true })

--Executing and run code
local run_table = {
  ['cpp'] = 'g++ -Wall % -o %:r.out && time ./%:r.out && rm %:r.out',
  ['c'] = 'gcc % -o %:r && ./%:r',
  ['python'] = 'python %',
  ['java'] = 'javac % && java %:r',
  -- ['lua'] = 'lua %:t',
  -- ['zsh'] = 'zsh %:t',
  -- ['sh'] = 'sh %:t',
  -- ['rust'] = 'rustc %:t && ./%:r',
  ['go'] = 'go run %',
}

local debug_table = {
  ['cpp'] = 'g++ -ggdb -Wall -Wextra -O2 % -o %:r',
}

vim.keymap.set('n', '<leader>cc', function()
  if run_table[vim.bo.filetype] then
    vim.cmd([[w | botright vsplit | term ]] .. run_table[vim.bo.filetype])
  else
    print 'FileType not supported'
  end
end, { desc = 'Compile and run code!' })

local function debug_code()
  if debug_table[vim.bo.filetype] then
    vim.cmd([[w | botright vsplit | term ]] .. debug_table[vim.bo.filetype])
  else
    print 'FileType not supported'
  end
end

vim.keymap.set('n', '<leader>cd', debug_code, { desc = 'Debug this code!' })

--Toggle Nvim-tree
vim.keymap.set('n', '<F2>', '<Cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree', silent = true })

--Toggle Oil.nvim
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

vim.keymap.set(
  'n',
  '<leader>o',
  '<Cmd>lua vim.ui.open(vim.fn.expand("%"))<CR>',
  { desc = 'Open current file in browser' }
)

vim.keymap.set('n', '<leader>a', 'ggVGo', { desc = 'Select all' })
