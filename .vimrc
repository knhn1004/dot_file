set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-rails.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'prettier/vim-prettier'
Plugin 'takac/vim-hardtime'
Plugin 'gko/vim-coloresque'
Plugin 'airblade/vim-gitgutter'
Plugin 'bagrat/vim-buffet'
Plugin 'Yggdroot/indentLine'
Plugin 'junegunn/vim-easy-align'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'dense-analysis/ale'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'jvanja/vim-bootstrap4-snippets'
Plugin 'honza/vim-snippets'



" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'

" scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

" My settings--------------------------------------------------------------

" line numbers --------------------------------------------------------
set number
set rnu


" cursor ---------------------------------------------------------------
set cursorcolumn


" searching ---------------------------------------------------------------
set ignorecase
set hlsearch
set incsearch


" default tabs ---------------------------------------------------------------
set tabstop=4


" for splitting windows ---------------------------------------------
set splitbelow
set splitright


"split navigations --------------------------------------------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" color scheme -----------------------------------------------------
syntax on
set t_Co=256
colorscheme gruvbox
set bg=dark

" NERDTree settings------------------------------------------------
" open a NERDTree automatically when vim starts up if no files were specified"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"open NERDTree automatically when vim starts up on opening a directory"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" specify Ctrl+a to open NERDTree"
verbose map <C-a> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"set relative line numbers upon entering nerdtree on vim"
let g:NERDTreeShowLineNumbers=1
autocmd BufEnter NERD_* setlocal rnu


" nerdcommenter settings ----------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" ale settings -------------------------------------------------
" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" use quickfix instead of loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" quickfix setting
nnoremap <Leader>qf :cw<cr>


" prettier settings --------------------------------------------------------
" By default parsing errors will open the quickfix but can also be disabled
" let g:prettier#quickfix_enabled = 0
" By default we auto focus on the quickfix when there are errors but can also be disabled
" let g:prettier#quickfix_auto_focus = 0


" vim-hardtime settings ----------------------------------------------------
" hardtime to run in every buffer
let g:hardtime_default_on = 1
" Set the list of keys to be banned of use with hardtime
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []
" enable the notification about HardTime being enabled
let g:hardtime_showmsg = 1
" Ignore Quickfix
let g:hardtime_ignore_quickfix = 1
" Maximum number of repetative key preses
let g:hardtime_maxcount = 2

" vim-buffet settings -------------------------------------
" Mappings for switching buffers
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

" wipe the current buffer without closing the window
noremap <Leader>d :Bw!<CR>
" wipe every buffer except this window
noremap <Leader><Leader>d :Bonly!<CR>

let g:buffet_always_show_tabline = 1
let g:buffet_show_index = 1

function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=1 ctermfg=8 guibg=#00FF00 guifg=#000000
    hi! BuffetBuffer cterm=NONE ctermbg=6 ctermfg=8 guibg=#00FF00 guifg=#000000

endfunction

" vim-easy-align settings -----------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim fold settings
set foldmethod=indent

" background color bug fix
if &term =~ '256color'
		" Disable Background Color Erase (BCE) so that color schemes
		" work properly when Vim is used inside tmux and GNU screen.
		set t_ut=
endif


" disable highlight after searching-------------------------------------
nnoremap <Leader><space> :noh<cr>

" ultisnips settings--------------------------------------------------
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets="<Leader><tab>"


" set listchars-------------------------------------------------
set list
set list lcs=tab:\|\ 
set listchars=eol:¬

" shell fix --------------------------------------------------------
set shellcmdflag=-ic

" tabstop settings--------------------------------------------------
set tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufRead,BufNewFile *.htm,*.html,*.css,*.scss,*.js setlocal tabstop=2 shiftwidth=2 softtabstop=2

" indentLine settings---------------------------------------------------


" powerline settings;
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
