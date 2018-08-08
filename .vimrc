"source $VIMRUNTIME/defaults.vim

set encoding=utf-8

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
	set undodir=~/.vim/.undo//
	set backupdir=~/.vim/.backup//
	set directory=~/.vim/.swp//
  endif
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  autocmd FileType text setlocal textwidth=120

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'Valloric/YouCompleteMe'
Plug 'dpelle/vim-LanguageTool'
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'zah/nim.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'jeaye/color_coded'
Plug 'vim-scripts/utags'

call plug#end()

syntax enable

set ts=4 sts=4 sw=4 expandtab

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

hi clear SpellBad
hi clear SpellLocal hi clear SpellRare
hi clear SpellCap
hi SpellBad cterm=underline
hi link SpellCap Normal
hi clear Conceal
hi Conceal cterm=bold ctermbg=NONE ctermfg=darkblue
hi BadWhitespace ctermbg=red
let g:pandoc#syntax#conceal#blacklist = ["endashes", "emdashes", "ellipses"]
let g:pandoc#keyboard#wrap_cursor = 1

" Leader
let mapleader = ","

nnoremap <Leader>wy viwy
nnoremap <Leader>wp "_ciw<C-R>"<Esc>

" Copy/Paste system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Cutting remaps
"nnoremap x "_x
"nnoremap d "_d
"nnoremap D "_D
"vnoremap d "_d
"nnoremap <leader>d ""d
"nnoremap <leader>D ""D
"vnoremap <leader>d ""d

" Soft line break
"vmap <C-j> gj
"vmap <C-k> gk
"vmap <C-4> g$
"vmap <C-6> g^
"vmap <C-0> g^
"nmap <C-j> gj
"nmap <C-k> gk
"nmap <C-4> g$
"nmap <C-6> g^
"nmap <C-0> g^

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-]> :YcmCompleter GoTo<CR>

" Python
let g:ycm_autoclose_preview_window_after_completion=1
map gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map gr  :YcmCompleter GoToReferences<CR>
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
if has("autocmd")
  au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.hpp match BadWhitespace /\s\+$/
  au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.hpp set nu
  au BufRead,BufNewFile *.cpp,*.hpp set syntax=cpp11
endif

" C++
let g:ycm_collect_identifiers_from_tags_files = 1

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

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

let g:languagetool_jar='$HOME/languagetool/languagetool-commandline.jar'
let g:SimpylFold_docstring_preview=1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_symbols_ascii = 1

map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
"imap <C-K> <c-o>:pyf <path-to-this-file>/clang-format.py<cr>
nmap <C-A> :b#<cr>
nmap gd :Gdiff<cr>
nmap gs :Gstatus<cr>
