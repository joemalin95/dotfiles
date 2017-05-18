set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-airline'
Plugin 'wikitopian/hardmode'
Plugin 'lambdatoast/elm.vim'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set laststatus=2
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" hide buffers rather than close them if unsaved changes persist on buffer switch
set hidden

" enable language-specific syntax highlighting
syntax enable

" enable 256 colors
set t_Co=256

" set color theme
colo elflord

" show line numbers
set number

" set tabs to have 4 spaces
set tabstop=4
set softtabstop=4

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" leader is comma
let mapleader=","

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"enable folding
set foldenable

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" tabs turn into spaces
set expandtab

" indent when moving to the next line
set autoindent
set pastetoggle=<leader>p

" turn on NERDTree with C-n
map <C-n> :NERDTreeToggle<CR>

" disables Ctrl-z (for Joey)
map <C-z> <Nop>

" toggle hard mode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" default hard mode on
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 0 

let g:syntastic_php_checkers=['php','phpcs','phpmd']
let g:syntastic_javascript_checkers = ['jshint']
" let b:syntastic_skip_checks = 0

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

map <leader><leader> :Shell ./build<CR><CR>

map <leader>d :bd<CR>

map <leader>e :!./build --prod<CR>

" sane vim window switching (switch vim windows using only Ctrl + h,j,k,l)
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" bind jj to Esc only in insert mode
imap jj <Esc>
