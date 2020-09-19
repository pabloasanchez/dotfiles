function! myspacevim#after() abort

  nnoremap <F9> :NodeInspectToggleBreakpoint<cr>
  nnoremap <F4> :NodeInspectStart
  nnoremap <F5> :NodeInspectRun<cr>
  nnoremap <F7> :NodeInspectStepInto<cr>
  nnoremap <F8> :NodeInspectStepOver<cr>
  nnoremap <F10> :NodeInspectStop<cr>
  nnoremap <silent><ESC> :Bwipeout<cr>
  nnoremap <S-ScrollWheelDown> :tabn<Enter>
  nnoremap <S-ScrollWheelUp> :tabp<Enter>

  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
  set statusline+=%F
  set laststatus=2

endfunction
