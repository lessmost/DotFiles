set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" Personal Settings
set showcmd
set showmatch
set ignorecase
set smartcase
set hlsearch
set nocompatible
set autoindent
set smartindent
set ruler
set incsearch
set guioptions-=r
colorscheme desert

" Let VIM jump to the last position when re-opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5,gb1803

set nu!
set si

filetype plugin indent on

set guifont=Consolas:h10

"use space rather than tab
set expandtab
"maybe Smart Tab plugin is better

" tabstop
if has("autocmd")
    autocmd FileType javascript setlocal ts=4 sw=4 expandtab
    "autocmd FileType python setlocal ts=4 sts=4 sw=4
    autocmd FileType c setlocal ts=4 sw=4
    autocmd FileType cpp setlocal ts=4 sw=4
    autocmd FileType java setlocal ts=4 sw=4 expandtab
endif

" Special character display
"set list
set listchars=tab:>_,trail:.,extends:#,eol:$

" backup setting, save to dir
set backupdir=C:\Vim\backup
let myvar = strftime("%y%m%d_%H%M")
let myvar = "set backupext=_".myvar
execute myvar

" Omni completion
set omnifunc=syntaxcomplete#Complete

" SuperTab -> change to AutoComplPop
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabMappingForward = "<s-tab>"
"let g:SuperTabMappingBackward = "<tab>"

"AutoComplPop plugin installed.
"plus C-N, C-P anyword completion

" TagBar
let g:tagbar_ctags_bin = 'C:\Vim\ctags.exe'
let g:tagbar_width = 30
nmap <F7> :TagbarToggle<cr>

" use space in normal mode for fold open/close
set foldmethod=indent
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" open all fold by default
autocmd Syntax c,cpp,vim,xml,html,javascript normal zR
