-- 入力補完（インサートモード）のキーマッピング
-- CoC の pumvisible() / coc#refresh() を使うため VimScript で記述

vim.cmd([[
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

  inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

  inoremap <silent><expr> <CR>
        \ pumvisible() ? coc#_select_confirm() :
        \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]])
