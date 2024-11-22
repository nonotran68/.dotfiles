-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

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

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

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
vim.keymap.set('n', '<A-left>', '<Cmd>BufferPrevious<CR>', { desc = 'Move to previous buffer', noremap = true, silent = true })
vim.keymap.set('n', '<A-right>', '<Cmd>BufferNext<CR>', { desc = 'Move to next buffer', noremap = true, silent = true })
-- Re-order to previous/next
vim.keymap.set('n', '<A-S-left>', '<Cmd>BufferMovePrevious<CR>', { desc = 'Reorder to previous buffer', noremap = true, silent = true })
vim.keymap.set('n', '<A-S-right>', '<Cmd>BufferMoveNext<CR>', { desc = 'Reorder to next buffer', noremap = true, silent = true })
vim.keymap.set('n', '<A-w>', function()
  vim.cmd 'confirm BufferClose'
end, { desc = 'Close buffer', noremap = true, silent = true })

vim.keymap.set('n', '<A-o>', function()
  vim.cmd.new()
  vim.cmd.close()
  vim.cmd.BufferNext()
end, { desc = 'Open buffer', noremap = true, silent = true })

--Executing and run code
local run_table = {
  ['cpp'] = 'g++ -Wall -Wextra -Weffc++ -Wconversion -Wsign-conversion -O2 -std=c++23 %:p -o %:p:r && time %:p:r && rm %:p:r',
  ['c'] = 'gcc -Wall %:p -o %:p:r && %:p:r',
  ['python'] = 'python %:p',
  ['java'] = 'javac %:p && java %:p:r',
  -- ['lua'] = 'lua %:t',
  -- ['zsh'] = 'zsh %:t',
  -- ['sh'] = 'sh %:t',
  -- ['rust'] = 'rustc %:t && ./%:r',
  ['go'] = 'go run %:p',
}

local run_table_with_inp_file = {
  ['cpp'] = 'g++ -Wall -Wextra -Weffc++ -Wconversion -Wsign-conversion -O2 -std=c++23 %:p -o %:p:r && time %:p:r < %:p:r.inp && rm %:p:r',
  ['c'] = 'gcc -Wall %:p -o %:p:r && %:p:r',
  ['python'] = 'python %:p',
  ['java'] = 'javac %:p && java %:p:r',
  -- ['lua'] = 'lua %:t',
  -- ['zsh'] = 'zsh %:t',
  -- ['sh'] = 'sh %:t',
  -- ['rust'] = 'rustc %:t && ./%:r',
  ['go'] = 'go run %:p',
}

local debug_table = {
  ['cpp'] = 'g++ -ggdb -Wall -Wextra %:p -o %:p:r',
}

local function debug_code()
  if debug_table[vim.bo.filetype] then
    vim.cmd([[w | botright split | term ]] .. debug_table[vim.bo.filetype])
  else
    print 'FileType not supported'
  end
end

local function run_code()
  if run_table[vim.bo.filetype] then
    vim.cmd([[w | botright split | term ]] .. run_table[vim.bo.filetype])
  else
    print 'FileType not supported'
  end
end

local function run_code_with_inp_file()
  if run_table[vim.bo.filetype] then
    vim.cmd([[w | botright split | term ]] .. run_table_with_inp_file[vim.bo.filetype])
  else
    print 'FileType not supported'
  end
end

vim.keymap.set('n', '<leader>cc', run_code, { desc = 'Compile and run!' })
vim.keymap.set('n', '<leader>cd', debug_code, { desc = 'Compile for debug!' })
vim.keymap.set('n', '<leader>ci', run_code_with_inp_file, { desc = 'Compile and run (with input)!' })

--Toggle Nvim-tree
vim.keymap.set('n', '<F2>', '<Cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree', silent = true })

--Toggle Oil.nvim
vim.keymap.set('n', '<leader>-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' })

vim.keymap.set('n', '<leader>o', '<Cmd>lua vim.ui.open(vim.fn.expand("%"))<CR>', { desc = 'Open current file in browser' })

vim.keymap.set('n', '<leader>a', 'ggVGo', { desc = 'Select all' })

-- Shortcut to use blackhole register by default
vim.keymap.set({ 'n', 'v' }, '_d', '"_d', { desc = 'delete', noremap = true, silent = true })
vim.keymap.set('n', '_D', '"_D', { desc = 'delete to the end of the line', noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '_c', '"_c', { desc = 'delete and enter insert mode', noremap = true, silent = true })
vim.keymap.set('n', '_C', '"_C', { desc = 'delete to the end of the line and enter insert mode', noremap = true, silent = true })

-- Insert newlines without entering insert mode
vim.keymap.set('n', '<CR>', 'o<Esc>"_D', { noremap = true, silent = true })
vim.keymap.set('n', '<S-CR>', 'O<Esc>"_D', { noremap = true, silent = true })

--Magic keymap to to wrap a block of code with curly braces
vim.keymap.set('v', '<leader>{', '<Esc>`<O<Esc>i{<Esc>`>o<Esc>i}<Esc>gv>[{', { noremap = true, silent = true })

-- vim.keymap.set('n', '<leader>T', '<Cmd>ToggleTerm<CR>', { noremap = true, silent = true, desc = 'Toggle terminal' })
local open_terminal_in_buffer_dir = function()
  -- Lấy thư mục của buffer hiện tại
  local buf_dir = vim.fn.expand '%:p:h'
  if buf_dir ~= '' then
    -- Chuyển thư mục terminal sang thư mục buffer
    vim.cmd('lcd ' .. buf_dir)
  end
  -- Mở terminal trong cửa sổ mới
  vim.api.nvim_command 'sp | terminal'
end

-- Gán hàm vào phím tắt, ví dụ <leader>t
vim.keymap.set('n', '<A-t>', open_terminal_in_buffer_dir, { noremap = true, silent = true })
vim.keymap.set('t', '<A-t>', '<C-\\><C-n><Cmd>bd!<CR>', { noremap = true, silent = true })
