-- Make Ranger replace netrw and be the file explorer
vim.g.rnvimr_ex_enable = 1
vim.g.rnvimr_draw_border = 1
vim.g.rnvimr_pick_enable = 1
vim.g.rnvimr_bw_enable = 1
-- " Customize the initial layout
-- vim.cmd(`let g:rnvimr_layout = {
--             \ 'relative': 'editor',
--             \ 'width': float2nr(round(0.7 * &columns)),
--             \ 'height': float2nr(round(0.7 * &lines)),
--             \ 'col': float2nr(round(0.15 * &columns)),
--             \ 'row': float2nr(round(0.15 * &lines)),
--             \ 'style': 'minimal'
--             \ }`)
-- vim.cmd('let g:rnvimr_layout = {\'relative\': \'editor\',\'width\': float2nr(round(0.7 * &columns)), \'height\': float2nr(round(0.7 * &lines)),\'col\': float2nr(round(0.15 * &columns)),\'row\': float2nr(round(0.15 * &lines)),\'style\': \'minimal\'}')
-- vim.cmd('let g:rnvimr_layout = {\'relative\': \'editor\', \'width\': &columns, \'height\': &lines - 2,\'col\': 0, \'row\': 0, \'style\': \'minimal\'}')
-- vim.g.rnvimr_layout = {
-- 	relative = 'editor',
-- 	width = 500,
-- 	-- height = float2nr(round(0.9 * lines)),
-- 	-- col = float2nr(round(0.15 * columns)),
-- 	-- row = float2nr(round(0.15 * lines)),
-- 	-- style = 'minimal'
-- }
