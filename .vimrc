" Normal settings
set showcmd	" Show (partial) command in status line.
set showmatch	" Show matching brachets.
set ignorecase	" Do case insensitive matching.
set smartcase 	" Do smart case matching.
set mouse=a	" Enable mouse usage (all modes) in terminals.
set hlsearch

" let vim to jump to the last position when reopening a file.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5,gb18030
set nu!
"set spell
syntax enable
"set helplang=cn
set si
"set ci
"set cindent
colorscheme desert
filetype plugin indent on

" omnicompletion setting
set omnifunc=syntaxcomplete#Complete

" SuperTab setting
"let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward = "<s-tab>"
let g:SuperTabMappingBackward = "<tab>"


"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let g:winManagerWindowLayout="FileExplorer|TagList"
"nmap wm :WMToggle<cr>

" backup settings
set backupdir=~/.backup/vim
set backup
set writebackup

"set guifont=Droid\ Sans\ Mono\ 11

"set tw=80

" :cw make, previous or next error
nmap <F2> :cn<cr>
nmap <f3> :cp<cr>

" Rgrep
nmap <F4> :Rgrep<cr>

"qfn
map mm <Plug>QuickFixNote

" xterm & screen
if match($TERM, "screen")!=-1
		set term=xterm
endif

" work with tab! 
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
set expandtab
set list
set listchars=tab:>-,trail:.,extends:#
"if has("autocmd")
"    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
"    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
"    autocmd FileType c setlocal ts=4 sts=4 sw=4 expandtab
"    autocmd FileType cpp setlocal ts=4 sts=4 sw=4 expandtab
"endif
"set t_ti= t_te=
