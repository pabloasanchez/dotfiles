func! myspacevim#before() abort
  " Disable vimfiler on startup
  let g:spacevim_enable_vimfiler_welcome = 0
  
  " Limelight plugin colors
  " Color name (:help cterm-colors) or ANSI code
  let g:limelight_conceal_ctermfg = 'gray'
  let g:limelight_conceal_ctermfg = 240

  " Color name (:help gui-colors) or RGB color
  let g:limelight_conceal_guifg = 'DarkGray'
  let g:limelight_conceal_guifg = '#777777'

  " Default 0.5
  let g:limelight_default_coefficient = 0.6

  " Number of preceding/following paragraphs to include  (default: 0)
  let g:limelight_paragraph_span = 24

  " Beginning/end of paragraph
  " When there's no empty line between the paragraphs and each paragraph starts with indentation
  let g:limelight_bop = '^\s'
  let g:limelight_eop = '\ze\n^\s'

  " Highlighting priority (default: 10). Set it to -1 not to overrule hlsearch
  let g:limelight_priority = -1

  " Run on startup
  call fzf#install()
  call yankstack#setup()
  execute ":FloatermNew --width=1.0 --height=1.0 ranger"

endf

" Test here: undefined, true, false, false, true "true", width, height, x, z,
" z
function CycleReplaceMany(word, lists)
  
  for i in a:lists
    if CycleReplace(a:word, i) 
      return
    endif
  endfor

  echom "Nothing to replace."

endfunction

function CycleReplace(word, list)

  let replaced = a:word

  let count = 0
  for i in a:list

    if a:word == i
      if count+1 < len(a:list)
        let replaced = a:list[count+1]
      else
        let replaced = a:list[0]
      endif
    break
    endif
    
  let count += 1
  endfor
  
  if replaced != a:word 
    execute ":normal m`ciw" . replaced
    execute ":normal ``"
    echom a:word . " -> " . replaced
    return 1
  endif

  return 0

endfunction

function! myspacevim#after() abort

  ":Limelight
  
  " Cycle through words custom function
  nnoremap <C-L> :execute ":call CycleReplace(expand('<cword>'), ['true', 'false', 'undefined', 'null'])" <CR>
  nnoremap <C-S-L> :execute ":call CycleReplaceMany(expand('<cword>'), [ ['let', 'const'], ['let', 'var'], ['true', 'false'], ['undefined', 'null'], ['width', 'height'], ['x', 'y', 'z'] ])" <CR>

  " Vars
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
  set laststatus=2
  let g:user_emmet_leader_key=','
  set listchars=tab:▸\ ,eol:¬
  set switchbuf-=split
  set statusline+=%F
  set ignorecase

  " Abbreviations
  iabbrev ,f function 
  iabbrev ,c class 

  " NodeInspect Plugin mappings
  nnoremap <F5> :NodeInspectStart
  nnoremap <F6> :NodeInspectRun<cr>
  nnoremap <F7> :NodeInspectStepInto<cr>
  nnoremap <F8> :NodeInspectStepOver<cr>
  nnoremap <F9> :NodeInspectToggleBreakpoint<cr>
  nnoremap <F10> :NodeInspectStop<cr>

  " Floating Terminal and fuzzy search mappings
  nnoremap <silent><F4> :FloatermNew --autoclose=1 --width=1.0 --height=1.0 ranger<cr>
  nnoremap <F12> :FloatermToggle<cr>
  nnoremap <C-S-G> :FloatermNew --autoclose=1 lazygit<cr>
  nnoremap <C-p> :Files<Enter>
  nnoremap <ESC> :hide<cr>
 
  " CTRL + F 
  nnoremap <A-f> :Lines<Enter>
  nnoremap <C-f> :BLines<Enter>
  nnoremap <C-A-f> :Rg<Enter>

  " Switch tabs
  nnoremap <C-tab> :tabn<Enter>
  nnoremap <S-C-tab> :tabp<Enter>

  " VSCode type mappings
  nnoremap <C-A-down> yyp
  nnoremap <C-A-j> yyp
  nnoremap <C-A-up> yypk
  nnoremap <C-A-k> yypk
  nnoremap <A-down> ddp
  nnoremap <A-j> ddp
  nnoremap <A-up> ddkkp
  nnoremap <A-k> ddkkp
  nnoremap <C-del> ldiwx
  nnoremap <C-D> dd

  vnoremap <C-A-down> yP}0
  vnoremap <C-A-down> yP

  imap <C-A-down> <ESC>yypi
  imap <C-A-j> <ESC>yypi
  imap <C-A-up> <ESC>yypki
  imap <C-A-k> <ESC>yypki
  imap <A-down> <ESC>ddpi
  imap <A-j> <ESC>ddpi
  imap <A-up> <ESC>ddkkpi
  imap <A-k> <ESC>ddkkpi
  imap <A-k> <ESC>ddkkpi
  imap <C-l> <C-O>l
  " imap <C-h> <C-O>h
  imap :w <ESC>:w
  imap <C-Z> <C-W> 
  imap <C-del> <ESC>ldiwxi
  imap <C-D> <ESC>ddi

  " Scrolling and movement
  nnoremap <S-up> 4k
  " nnoremap <A-k> 4k
  nnoremap <S-down> 4j
  " nnoremap <A-j> 4j
  nnoremap <C-down> 4<C-e>
  nnoremap <C-j> 4<C-e>
  nnoremap <C-up> 4<C-y>
  nnoremap <C-k> 4<C-y>
  nnoremap <C-left> B
  nnoremap <C-h> B
  nnoremap <C-right> W
  " nnoremap <C-l> W
  nnoremap <C-home> gg
  nnoremap <C-end> G

  " Save / Close ...
  map <C-s> :w<CR>
  imap <C-s> :w<CR>
  
  " Fast quit
  map <C-q> :qa<CR>

  " Buffer operations
  nnoremap <C-W> :BufferClose<cr>
  nnoremap <C-N> :only<cr> 
  
  " Move to previous/next
  nnoremap <silent>    <A-,> :BufferPrevious<CR>
  nnoremap <silent>    <A-.> :BufferNext<CR>
  nnoremap <A-ScrollWheelUp> :BufferPrevious<CR>
  nnoremap <A-ScrollWheelDown> :BufferNext<CR>
  nnoremap <S-ScrollWheelUp> :BufferPrevious<CR>
  nnoremap <S-ScrollWheelDown> :BufferNext<CR>
  nnoremap <silent>    <A-h> :BufferPrevious<CR>
  nnoremap <silent>    <A-l> :BufferNext<CR>

  " Re-order to previous/next
  nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
  nnoremap <silent>    <A->> :BufferMoveNext<CR>
  
  " Goto buffer in position...
  nnoremap <silent>    <A-1> :BufferGoto 1<CR>
  nnoremap <silent>    <A-2> :BufferGoto 2<CR>
  nnoremap <silent>    <A-3> :BufferGoto 3<CR>
  nnoremap <silent>    <A-4> :BufferGoto 4<CR>
  nnoremap <silent>    <A-5> :BufferGoto 5<CR>
  nnoremap <silent>    <A-6> :BufferGoto 6<CR>
  nnoremap <silent>    <A-7> :BufferGoto 7<CR>
  nnoremap <silent>    <A-8> :BufferGoto 8<CR>
  nnoremap <silent>    <A-9> :BufferLast<CR>
  
  " Highlight colors
  highlight Visual cterm=NONE ctermbg=Gray30 ctermfg=White guibg=Gray40
  highlight Search cterm=NONE ctermbg=Gray20 ctermfg=White guibg=Gray30
  highlight Comment ctermbg=DarkGray
  highlight Constant ctermbg=Blue
  highlight Normal ctermbg=DarkGray
  highlight NonText ctermbg=DarkGray
  highlight Special ctermbg=DarkMagenta
  highlight Cursor ctermbg=Green
  highlight Normal=white guifg=white

endfunction
