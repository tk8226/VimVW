vim.api.nvim_set_keymap('n', '-', ':RnvimrToggle<CR>', {noremap = true, silent = true})

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- TODO fix this
-- Terminal window navigation
vim.cmd([[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]])

-- TODO fix this
-- resize with arrows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- -- I hate escape
-- vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- fix to get netrw's gx command to work correctly
vim.api.nvim_set_keymap('n', 'gx', ":call netrw#BrowseX(expand((exists('g:netrw_gx')? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<cr>", {noremap = true, silent = true})

vim.cmd('vnoremap p "0p')
vim.cmd('vnoremap P "0P')
-- vim.api.nvim_set_keymap('v', 'p', '"0p', {silent = true})
-- vim.api.nvim_set_keymap('v', 'P', '"0P', {silent = true})

-- vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')

-- vim.api.nvim_set_keymap('i', '<C-TAB>', 'compe#complete()', {noremap = true, silent = true, expr = true})

-- vim.cmd([[
-- map p <Plug>(miniyank-autoput)
-- map P <Plug>(miniyank-autoPut)
-- map <leader>n <Plug>(miniyank-cycle)
-- map <leader>N <Plug>(miniyank-cycleback)
-- ]])

-- Toggle the QuickFix window
vim.api.nvim_set_keymap('', '<C-q>', ':call QuickFixToggle()<CR>', {noremap = true, silent = true})

-------------------- MAPPINGS ------------------------------
-- vim.api.nvim_set_keymap('v', '<C-S-c>', '"+y', {noremap = true, silent = false}) 	-- Make <C-s> Save

vim.api.nvim_set_keymap('n', '<C-s>', ':update<CR>', {noremap = true, silent = true}) 	-- Make <C-s> Save
vim.api.nvim_set_keymap('i', '<C-s>', '<C-O>:update<CR><ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-s>', '<C-C>:update<CR><ESC>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<C-q>', ':quit<CR>', {noremap = true, silent = true}) 	-- Make <C-s> Save
vim.api.nvim_set_keymap('i', '<C-q>', '<C-O>:quit<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-q>', '<C-C>:quit<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})-- better window movement
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', {noremap = true, silent = true})


-------------------- RNVIMR ------------------------------
vim.api.nvim_set_keymap('n', '<C-A-o>', ':RnvimrToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-A-o>', '<C-\\><C-n>:RnvimrToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-A-o>', '<C-O>:update<CR><C-O>:RnvimrToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-A-o>', '<C-C>:update<CR><C-C>:RnvimrToggle<CR>', {noremap = true, silent = true})

--------------------------- BARBAR -----------------------------------

vim.api.nvim_set_keymap('n', '<A-<>', ':BufferMovePrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A->>', ':BufferMoveNext<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<A-b>', ':BufferPick<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<A-1>', ':BufferGoto 1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-2>', ':BufferGoto 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-3>', ':BufferGoto 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-4>', ':BufferGoto 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-5>', ':BufferGoto 5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-6>', ':BufferGoto 6<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-7>', ':BufferGoto 7<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-8>', ':BufferGoto 8<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-9>', ':BufferLast<CR>', { noremap = true, silent = true })

--------------------------- TELESCOPE -----------------------------------
-- In WhichKey
