packadd minpac
call minpac#init()

" Endwise
call minpac#add('tpope/vim-endwise')
" Ruby
call minpac#add('vim-ruby/vim-ruby')
" Multiple Cursos
call minpac#add('terryma/vim-multiple-cursors')
" Elixir
call minpac#add('elixir-lang/vim-elixir')
call minpac#add('slashmili/alchemist.vim')
" Conflicted
call minpac#add('christoomey/vim-conflicted')
" Surround
call minpac#add('tpope/vim-surround')
" Fugitive
call minpac#add('tpope/vim-fugitive')
" Commentary
call minpac#add('tpope/vim-commentary')
" Rspec
call minpac#add('thoughtbot/vim-rspec')
" Dispatch
call minpac#add('tpope/vim-dispatch')
" Neodark colorscheme
call minpac#add('NLKNguyen/papercolor-theme')
" Fzf
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
" Yank highlight
call minpac#add('machakann/vim-highlightedyank')
map y <Plug>(highlightedyank)
hi HighlightedyankRegion cterm=reverse gui=reverse

" Minpac updater
call minpac#add('k-takata/minpac', {'type': 'opt'})

" minpac commands:
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

let mapleader = "\<Space>"

nmap <leader>vr :sp $MYVIMRC
nmap <leader>so :source $MYVIMRC

set noeol

set textwidth=120

set t_Co=256

syntax on
syntax enable
set ruler
set relativenumber
set shell=/bin/zsh

runtime macros/matchit.vim

" Vim Ruby
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set number

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

imap <C-s> <esc>:w<cr>

nmap <Left> <NOP>
nmap <Right> <NOP>
nmap <Up> <NOP>
nmap <Down> <NOP>

" RSpec.vim mappings
nmap <Leader>t :wall<cr>:call RunCurrentSpecFile()<CR>
nmap <Leader>s :call RunNearestSpec()<CR>
nmap <Leader>l :call RunLastSpec()<CR>
nmap <Leader>a :call RunAllSpecs()<CR>

let g:rspec_runner = "os_x_iterm2"

" Use rspec with Disptach
let g:rspec_command = "Dispatch rspec {spec}"

" Fuzzyfinder remapping
nnoremap <leader>f :FZF<CR>
let g:fzf_layout = { 'down': '~30%' }

" Fuzzyfinder insert mode completion
imap <C-f> <plug>(fzf-complete-line)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" Most common command I use mapped as <Leader>{letter}
nnoremap <Leader>w :w<cr>
nnoremap <Leader>qq :q<cr>
nnoremap <Leader>foo :split foo.txt<cr>
" Fugitive Git shortcuts
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>fb :Buffers<cr>
" Zoom in/out current file
nnoremap <Leader>zi <C-W>_<C-W>\|
nnoremap <Leader>zo <C-W>=

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" backup files elsewhere
set backupdir=~/.vimbackup,/tmp
set directory=~/.vimbackup,/tmp

" Searching Highlight with * or # (clean with space)
set hlsearch
set incsearch
set ignorecase    " searches are case insensitive...
set smartcase     " ... unless they contain at least one capital letter
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
au! FileType mkd setlocal syn=off
" Don't syntax highlight markdown because it's often wrong.
au! BufRead,BufNewFile *.markdown set filetype=mkd
au! BufRead,BufNewFile *.md       set filetype=mkd

" Remove trailing whitespace on save
au BufWritePre *.rb :%s/\s\+$//e

" Navigation
set showmatch   " Show matching brackets. (navigate always with %)
set mat=5       " Bracket blinking.

" Fuzzy finder
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything
"  in the .git/ folder)
" --color: Search color options
 let g:rg_command = '
       \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
       \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
       \ -g "!{.git,node_modules,vendor,tmp/rubycritic}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" Colorscheme configs
set t_Co=256
set background=light
colorscheme PaperColor

" Python recommended config (see https://docs.python-guide.org/dev/env/#vim)
set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
