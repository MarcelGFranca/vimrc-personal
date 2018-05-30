filetype plugin indent on

set wrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

set hlsearch
set incsearch
set ignorecase
set smartcase
set number

set laststatus=2

let g:loaded_logipat = 1
let g:colorizer_auto_filetype = 'css,scss,html,less'
let mapleader = ' '

" save using inset mode
inoremap :w<CR> <ESC>:w<CR>a

" save and alter tab or close table
imap <Leader>bn <ESC>:w<CR><Leader>bn
imap <Leader>bp <ESC>:w<CR><Leader>bp
imap <Leader>bc <ESC>:w<CR><Leader>bc

" close or open nerdtree in insert mode
imap <Leader>nt <ESC><leader>nt<C-W>l:w<CR>a

" indent code whif visual mode
vmap <TAB> ><CR>gv
vmap <S-TAB> <<CR>gv

" reload document
nmap <F5> :e<CR>

" open nerd tree
nmap nt :NERDTreeToggle<CR>

" find file in nerd tree
nmap nf :NERDTreeFind<CR>

nmap gs :Gstatus<CR>
"nmap ggc :Gcommit<CR>
"nmap ggp :Gpush<CR>

nmap <C-f> <Plug>CtrlSFPrompt

nmap <Leader>vs<CR> :vs<CR>
nmap <Leader>hs<CR> :sp<CR>

"configuration horizontal resize
nmap <Leader>max<CR> :res<Space>+200<CR>
nmap <Leader>min<CR> :res<Space>-200<CR>
" up
nmap <Leader>k :res<Space>+10<CR>
" down
nmap <Leader>j :res<Space>-10<CR>

" configuration vertical resize
nmap <Leader>vmax<CR> :vertical<Space>resize<Space>-200<CR>
nmap <Leader>vmin<CR> :vertical<Space>resize<Space>+200<CR>
" left
nmap <Leader>h :vertical<Space>resize<Space>-10<CR>
" rigth
nmap <Leader>l :vertical<Space>resize<Space>+10<CR>

" configuration doc php
nmap  <Leader>doc :exec<Space>PhpDoc()<CR>''


" Buffer 
nnoremap <Leader>bp :bprev<CR>
nnoremap <Leader>bn :bnext<CR>
" Buffer deleting
nnoremap <Leader>bc :BD<CR>

vnoremap // y/<C-R>"<CR>



" =============================================================================
" Plugin Manager Setup
" =============================================================================
"
filetype off

" Install the plugin manager if it doesn't exist
let s:plugin_manager=expand('~/.vim/autoload/plug.vim')
let s:plugin_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if empty(glob(s:plugin_manager))
  echom 'vim-plug not found. Installing...'
  if executable('curl')
    silent exec '!curl -fLo ' . s:plugin_manager . ' --create-dirs ' .
          \ s:plugin_url
  elseif executable('wget')
    call mkdir(fnamemodify(s:plugin_manager, ':h'), 'p')
    silent exec '!wget --force-directories --no-check-certificate -O ' .
          \ expand(s:plugin_manager) . ' ' . s:plugin_url
  else
    echom 'Could not download plugin manager. No plugins were installed.'
    finish
  endif
  augroup vimplug
    autocmd!
    autocmd VimEnter * PlugInstall
  augroup END
endif

" Create a horizontal split at the bottom when installing plugins
let g:plug_window = 'botright new'

let g:plug_dir = expand('~/.vim/bundle')

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plug auto-loading
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'dyng/ctrlsf.vim'
Plug 'lilydjwg/colorizer'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'taohex/lightline-buffer'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plug 'jwalton512/vim-blade'
Plug 'valloric/youcompleteme'
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
Plug 'dracula/dracula-theme'
Plug 'sjl/badwolf'
Plug 'chriskempson/base16-vim'

" Plug On-demand loading
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" Initialize plugin system
call plug#end()

" Define colors
set t_Co=256
colorscheme gruvbox
"colorscheme industry
set background=dark

" define commentary for smarty language
autocmd FileType smarty setlocal commentstring={*\ %s\ *}

" lightLine Configuration
set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline

" use lightline-buffer in lightline
let g:lightline = {
	\ 'tabline': {
		\ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
		\ 'right': [ [ 'close' ], ],
		\ },
	\ 'component_expand': {
		\ 'buffercurrent': 'lightline#buffer#buffercurrent2',
		\ },
	\ 'component_type': {
		\ 'buffercurrent': 'tabsel',
		\ },
	\ 'component_function': {
		\ 'bufferbefore': 'lightline#buffer#bufferbefore',
		\ 'bufferafter': 'lightline#buffer#bufferafter',
		\ 'bufferinfo': 'lightline#buffer#bufferinfo',
		\ },
	\ }

" inplement cab section
cab W w
cab Wq wq
cab WQ wq
