set nocompatible              " required
filetype off                  " required

" ----------- General settings for Python development -----------
set encoding=utf-8
set nu

" set code folding (with spacebar)
" enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" flag unnecessary whitespace
:highlight BadWhitespace ctermbg=darkgreen guibg=darkgreen
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" PEP8 indentation and line limit, and unix file format
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" ----------- YouCompleteMe tweaks ----------
" hide YouCompleteMe window after you are done with it
let g:ycm_autoclose_preview_window_after_completion=1
" add shortcut to definition
map <C-g> :YcmCompleter GoToDefinitionElseDeclaration<CR>

" virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" ---------- Make code look pretty ----------
let python_highlight_all=1
syntax enable

" ---------- NERDTree settings ---------- 
" ignore .pyc file in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeShowHidden=1

autocmd vimenter * NERDTree

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
au VimEnter * wincmd l

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "u",
    \ "Renamed"   : "r",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "x",
    \ "Dirty"     : "!",
    \ "Clean"     : "c",
    \ 'Ignored'   : 'i',
    \ "Unknown"   : "?"
    \ }

" ---------- Powerline settings ----------
" Necessary to make powerline visible
set laststatus=2

" ---------- Syntastic settings ----------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" For Python development
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" This should be called after vundle#end()
" use solarized in gui mode and zenburn in terminal mode
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Customize nerdtree-git colors (based on PyCharm pallete)
:hi NERDTreeGitStatusModified guifg=#0087ff ctermfg=33
:hi NERDTreeGitStatusRenamed guifg=#0087ff ctermfg=33
:hi NERDTreeGitStatusIgnored guifg=#8a8a8a ctermfg=245
:hi NERDTreeGitStatusStaged guifg=#00ff00 ctermfg=46
:hi NERDTreeGitStatusUntracked guifg=#d70000 ctermfg=160
:hi NERDTreeGitStatusDirDirty guifg=#af005f ctermfg=125
:hi NERDTreeGitStatusDirClean guifg=#ffffff ctermfg=231
