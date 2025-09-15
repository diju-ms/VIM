"""" Enable Vundle: vim plugin manager

set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
syntax enable
filetype plugin indent on

"call plug#begin()
"alternatively, pass a path where Plug should install plugins
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/indentLine'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'godlygeek/tabular'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'MattesGroeger/vim-bookmarks'
"Plug 'altercation/vim-colors-solarized'
"Plug 'rr-/vim-hexdec'
Plug 'andreshazard/vim-logreview'
Plug 'frazrepo/vim-rainbow'
Plug 'preservim/nerdtree'
Plug 'NLKNguyen/papercolor-theme'
Plug 'simeji/winresizer'
Plug 'jiangmiao/auto-pairs'
Plug 'google/vim-searchindex'
Plug 'Vimjas/vim-python-pep8-indent'
"Plug 'davidhalter/jedi-vim'
Plug 'justinmk/vim-sneak'
Plug 'dyng/ctrlsf.vim'
Plug 'mechatroner/rainbow_csv'


Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junkblocker/git-time-lapse'



" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
"
"Commands
"Command	Description
"PlugInstall [name ...] [#threads]	Install plugins
"PlugUpdate [name ...] [#threads]	Install or update plugins
"PlugClean[!]	Remove unlisted plugins (bang version will clean without prompt)
"PlugUpgrade	Upgrade vim-plug itself
"PlugStatus	Check the status of plugins
"PlugDiff	Examine changes from the previous update and the pending changes
"PlugSnapshot[!] [output path]	Generate script for restoring the current snapshot of the plugins


"Enable matchit
runtime macros/matchit.vim

"""" Basic Behavior
set number              " show line numbers
set wrap                " wrap lines
"set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set mouse=a             " enable mouse support (might not work well on Mac OS X)
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline (even with only single window)
set ruler               " show line and column number of the cursor on right side of statusline
set visualbell          " blink cursor on error, instead of beeping


set noerrorbells        " 
set noswapfile
set nobackup
set undodir=~/.vimundo/undodir
set undofile
set clipboard=unnamedplus

"""" Tab settings
set expandtab           " convert <TAB> key-presses to spaces
set tabstop=2           " width that a <TAB> character displays as
set shiftwidth=2        " number of spaces to use for each step of (auto)indent
set softtabstop=2       " backspace after pressing <TAB> will remove up to this many spaces
set autoindent          " copy indent from current line when starting a new line
"set smartindent         " even better autoindent (e.g. add indent after '{')
set backspace=indent,eol,start  "enabling backspace key
"set guifont=Ubuntu\ Mono\ 12
set guifont=Monospace\ 12


set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevelstart=10

"""" Search settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore cases
set smartcase           " ignorecase but check cases when a letter is U/l

" turn off search highlighting with <CR> (carriage-return)
nnoremap <CR> :nohlsearch<CR><CR>

"""" Vim Appearance
set background=dark
"colorscheme solarized
"set background=light
colorscheme PaperColor

" use filetype-based syntax highlighting, ftplugins, and indentation
syntax on
syntax enable


"""" Miscellaneous settings that might be worth enabling
"set cursorline         " highlight current line
"set background=dark    " configure Vim to use brighter colors
"set autoread           " autoreload the file in Vim if it has been changed outside of Vim
"

highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

"""" Key Bindings for Tab operation
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove


""indent options
"set ts=4 sw=4 et
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

"IndentLine
let g:indentLine_enabled = 0

"for rainbow brackets
let g:rainbow_active = 1

"for copypath
let g:copypath_copy_to_unnamed_register = 1

"enable perl syntax
au Bufnewfile,bufRead *.pm,*.t,*.pl set filetype=perl6

augroup python_settings
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4
    autocmd BufNewFile,BufRead *.py setlocal softtabstop=4
    autocmd BufNewFile,BufRead *.py setlocal shiftwidth=4
    autocmd BufNewFile,BufRead *.py setlocal textwidth=79
    autocmd BufNewFile,BufRead *.py setlocal expandtab
    autocmd BufNewFile,BufRead *.py setlocal autoindent
    autocmd BufNewFile,BufRead *.py setlocal fileformat=unix
augroup END


"enble python syntax
"let g:python_highlight_all = 1


""for HEX-DEC using VIM
command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')
function! s:Dec2hex(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    else
      let cmd = 's/\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No decimal number found'
    endtry
  else
    echo printf('%x', a:arg + 0)
  endif
endfunction

command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
function! s:Hex2dec(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
    else
      let cmd = 's/0x\x\+/\=submatch(0)+0/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No hex number starting "0x" found'
    endtry
  else
    echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
  endif
endfunction

"""for HEX-DEC plugin
"nnoremap gbh :Dec2Hex<CR>
"nnoremap gbl :Dec2Hexl<CR>
"nnoremap gbd :Hex2Dec<CR>
"nnoremap gbt :ToggleHexDec<CR>

"copy-relative-path or copy-full-path
  "relative path
nmap <leader>crp :let @+ = expand("%")<CR>
  "full path
nmap <leader>cfp :let @+ = expand("%:p")<CR>
  "filename
nmap <leader>cfn :let @+ = expand("%:t")<CR>
  "dir name
nmap <leader>cdn :let @+ = expand("%:p:h")<CR>

"Adding or removing single or double quotes
" 'quote' a word
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
" double "quote" a word
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
" remove quotes from a word
nnoremap wq :silent! normal mpeld bhd `ph<CR>

" CtrlP will set its local working directory according to this variable:
let g:ctrlp_working_path_mode = 'ra'

nmap <leader>ne :NERDTree<cr>

"Sneak
let g:sneak#label = 1
map f <Plug>Sneak_s

"terminal
noremap <Leader>\t :botright vertical terminal<CR>

