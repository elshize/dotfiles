call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'adborden/vim-notmuch-address'
Plug 'altercation/vim-colors-solarized'
Plug 'bfrg/vim-cpp-modern'
Plug 'dpelle/vim-LanguageTool'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
" Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'rhysd/vim-grammarous'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-scripts/greplace.vim'
call plug#end()

" General Settings
set nu rnu
set encoding=utf-8
set backup
if has('persistent_undo')
    set undofile
	set undodir=~/.vim/.undo/
	set backupdir=~/.vim/.backup/
	set directory=~/.vim/.swp/
endif
set ts=4 sts=4 sw=4 expandtab
let mapleader = ","

" Autocmd
if has("autocmd")
  au FileType text setlocal textwidth=120
  au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.hpp match BadWhitespace /\s\+$/
  au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.hpp,*.java,*.rs set nu
  au FileType java let g:syntastic_html_checkers = []
  au FileType rust nmap <C-S-F> :RustFmt<CR>
  au FileType cpp map <C-S-F> :py3f /usr/share/clang/clang-format.py<cr>
  au bufwritepost .vimrc source $MYVIMRC
endif " has("autocmd")

" Syntax & Colors
syntax on
syntax enable
set background=dark
colorscheme solarized
hi clear SpellBad
hi clear SpellLocal hi clear SpellRare
hi clear SpellCap
hi SpellBad cterm=underline
hi link SpellCap Normal
hi clear Conceal
hi Conceal cterm=bold ctermbg=NONE ctermfg=darkblue
hi BadWhitespace ctermbg=red

" Pandoc
let g:pandoc#syntax#conceal#blacklist = ["endashes", "emdashes", "ellipses"]
let g:pandoc#keyboard#wrap_cursor = 1

" YCM: Python
let g:ycm_autoclose_preview_window_after_completion=1
map gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map gr  :YcmCompleter GoToReferences<CR>

" YCM: C++
let g:ycm_collect_identifiers_from_tags_files = 1

nnoremap <Leader>wy viwy
nnoremap <Leader>wp "_ciw<C-R>"<Esc>

" Copy/Paste system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-]> :YcmCompleter GoTo<CR>

nmap <Leader>/ :noh<CR>

nmap <C-T> :TagbarToggle<CR>
nmap <C-B> :Buffers<CR>
nmap <C-P> :Files<CR>

set wildmenu
set wildmode=longest:list,full

" Normalized pages count (1800 chars/page)
command! Pages call Pages()
function! Pages()
	let pages = system("expr `cat ".bufname("%")." | wc -m` / 1800")
    echohl ModeMsg
	echo 'Normalized pages: '.pages
    echohl None
endfunction

" LanguageTool
let g:languagetool_jar='$HOME/languagetool/languagetool-commandline.jar'

" Notmuch
let g:notmuch_custom_search_maps = {
    \ 't':		'search_tag("+to-do -inbox")',
    \ 'd':		'search_tag("+deleted -inbox -unread")',
    \ }
let g:notmuch_custom_show_maps = {
    \ 't':		'show_tag("+to-do -inbox")',
    \ 'd':		'show_tag("+deleted -inbox -unread")',
    \ }
