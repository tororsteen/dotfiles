" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.
"
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim
"
" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking! 
"set compatible
"#####################################################################################################
"Installasjon av Vundle;
set nocompatible              " be iMproved, required
"filetype off                  " required
"Brukes etter installasjonen
filetype on        
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"#####################################################################################################
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Andre plugins som Vundle skal behandle:
Plugin 'itchyny/calendar.vim'  				"Kalender
Plugin 'mbbill/undotree'					"Undo tilbake i tid
Plugin 'scrooloose/nerdtree'				"Åpne filer
Plugin 'jistr/vim-nerdtree-tabs'			"NerdTree i tab 
Plugin 'vim-airline/vim-airline'			"Statuslinje
Plugin 'vim-airline/vim-airline-themes'		"Temaer for airline
"Plugin 'colorsupport.vim'
"Plugin 'vim-latex/vim-latex'
Plugin 'lervag/vimtex'						"LaTex 
Plugin 'Matt-Deacalion/vim-systemd-syntax' 	"Uthever syntaks i systemd-filer
Plugin 'Townk/vim-autoclose'				"skriver ( og får automatisk ()
Plugin 'WolfgangMehner/c-support'			"c og c++ verktøy
Plugin 'NLKNguyen/papercolor-theme'			"Fargetema
Plugin 'PotatoesMaster/i3-vim-syntax'		"Utheving i filer til i3 vindusbehandler
Plugin 'majutsushi/tagbar'					"Viser klasser, funksjoner osv i ei .cpp-fil
Plugin 'powerman/vim-plugin-AnsiEsc'		"Farge på Esc-sekvenser
Plugin 'Valloric/YouCompleteMe'				"Fullfører ord mens vi skriver
Plugin 'vim-scripts/a.vim'					"Bytter mellom .cpp og .h
"Plugin 'junegunn/goyo.vim'
"#####################################################################################################
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
"#######################################################################################################
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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
"#######################################################################################################
set term=screen-256color
":colo morning
:colo PaperColor
let g:PaperColor_Theme_Options = {
\   'language': {
\     'python': {
\       'highlight_builtins' : 1
\     },
\     'cpp': {
\       'highlight_standard_library': 1
\     },
\     'c': {
\       'highlight_builtins' : 1
\     }
\   }
\ }
"
" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
:filetype on
if has("syntax")
  syntax on
endif
"
if exists("syntax_on")
  syntax reset
endif
"
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"###########################################################################################################
"Ikke vis uthveing fra gamle søk
:noh
"
"Ting som ikke skal brukes i gvim
if !has('gui_running')
	"Starter NerdTree automatisk
	"autocmd VimEnter * NERDTree
	"Bruker menyer i vim som i gvimm
	:source $VIMRUNTIME/menu.vim
	:set wildmenu
	:set cpo-=<
	:set wcm=<C-Z>
"	:map <F4> :emenu <C-Z>
	:nmap \M :emenu <C-Z>
endif
"
"##########################################################################################################
"Bruker Airline som statuslinje
"Setter opp font og tema i Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1
"let g:airline_theme='tomorrow'
"let g:airline_theme='understated'
"let g:airline_theme='papercolor'
let g:airline_theme='silver'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
set ttimeoutlen=2
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif
"
"Dette skal gjøre at Airline starter uten å åpne en ny splitt
set laststatus=2
"
"Dette skal fjerne statusmeldinger fra vim's egen statuslinje
set noshowmode
"
"######################################################################################################
"Får google-kalender inn i Calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:calendar_frame = 'default'
"
"#####################################################################################################
"Kommandoer for undotree
:nnoremap \U :UndotreeToggle<cr>
set undodir=~/.vim/undo
set undofile
"
"#######################################################################################################
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set hlsearch		"Uthever søkeord som er funnet
set tabstop=4		"Setter bredda på tabulator til 4
set shiftwidth=4	"Bredde brukt for automatisk innrykk
set smarttab		"Bruker verdien for shiftwidt i starten, eller tab-verdo
set number		"Linjenummerering på
set autoindent		"Automatisk innrykk i bash osv.
"set background=light	"Bruker farger for lys terminalbakgrunn
set wrap
set linebreak
set nolist  " list disables linebreak
filetype plugin indent on
set grepprg=grep\ -nH\ $*
"
"#######################################################################################################
"Kommandoer for LaTex
let g:tex_flavor = "latex"
"##########################################
"Kommando for xelatex. Komenter ut forrige linje
"let g:tex_flavor="xelatex"
"let g:Tex_CompileRule_pdf="xelatex --interaction=nonstopmode $*"
"###########################################
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf = 'zathura'
"Sett språk for bruk i Latex. nn=nynorsk, nb=bokmål
"autocmd FileType txt setlocal spell spelllang=nb 
set showtabline=2
"######################################################################################################
let NERDTreeShowHidden=1
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
"
" Legger inn meny for C++-programmering
let g:C_RootMenu = '&C\/C\+\+.'

"######################################################################################################
"Funksjon for å fjerne stygg utheving av feilstava ord
function Stave()
	:set spell spelllang=nb
	:syntax spell toplevel
	:highlight clear SpellBad
	:highlight SpellBad  ctermbg=Yellow
	:highlight clear SpellCap
	:highlight SpellCap ctermbg=LightBlue
	:highlight clear SpellRare
	:highlight SpellRare ctermfg=DarkGrey
	:highlight clear SpellLocal
	:highlight SpellLocal ctermfg=DarkGrey
endfunction
"Setter \S til å kjøre funksjonen Stave()
nmap \S :exec Stave()<CR>
autocmd FileType txt setlocal spell spelllang=nb 
autocmd BufRead,BufNewFile *.txt call Stave()
"call Stave()
"
"######################################################################################################
"Clipboard. Bruker clipcoard til kopiering
set clipboard=unnamedplus
"
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"
"#######################################################################################################
"Funksjon til å skrive ut som pdf
function Skriv()
	:hardcopy > %.ps | !ps2pdf %.ps && rm %.ps
endfunction
"Binder funksjonen til ctrl-P
nmap <C-p> :exec Skriv()<CR>
"
"#######################################################################################################
"Diverse bindinger for tastatur
"Setter \q til å fjerne markeringer etter søk
nmap \q :nohlsearch<CR>  
"Setter \p til å lime inn fra ekstern utklippstavle
nmap \p "+gp<CR>
"Setter \y til å kopiere til ekstern utklippstavle
vmap \y "+y<CR>
"Setter \d til å klippe ut til ekstern utklippstavle
vmap \d "+d<CR>
"Setter \N til å åpne NERDTree
nmap \N :NERDTreeTabsToggle<CR> 
"\A for å skifte statuslinje
nmap \A :AirlineToggle<CR>
"Setter \B til å bruke fargetema blue
nmap \B :colorscheme blue<CR>
"Setter register e til Latex uthev-kommando
let @e='\emph{}'
"Binder \u til Latex uthev-kommando
"nmap \u "ep
nnoremap \u @='i\emph{}<C-V><Esc>i'<CR>
"Binder ¤ til $ for å kunne bruke shift isteden for alt gr
noremap ¤ $
nmap d¤ d$ 
imap ¤ $
"Lagre som rot med :w!!
"cmap w!! w !sudo tee % 
cmap <C-K> Calendar -position=tab
nmap <C-m> :emenu <space> <tab>
nmap \t :TagbarToggle<CR>
