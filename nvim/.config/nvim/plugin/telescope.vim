nnoremap <leader>pd :lua require('geochip.telescope').search_dotfiles()<CR>
nnoremap <leader>pg :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ") })<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').lsp_document_symbols()<CR>

