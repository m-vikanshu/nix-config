--leader key selection
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

-- gets rid of the annoying banner for netrw
vim.g.netrw_banner = 0

--Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
--basic keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = '[P]re[v]iew the Ex mode' })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--for correcting bad behaviours
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

--for easier split navigation
--Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--for spellcheck
vim.keymap.set("n", "]s", "]s", { desc = "Next spelling error" })
vim.keymap.set("n", "[s", "[s", { desc = "Previous spelling error" })
vim.keymap.set("n", "z=", "z=", { desc = "Suggestions for spelling error" })
vim.keymap.set("n", "zg", "zg", { desc = "Add word to dictionary" })
vim.keymap.set("n", "zw", "zw", { desc = "Mark word as incorrect" })

-- Replace all instances of highlighted words
vim.keymap.set("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>", { desc = "[R]eplace the hightlighted word globally" })
