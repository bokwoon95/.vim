"{{{ Plugin Manager Initialization
silent! set encoding=utf-8
silent! scriptencoding utf-8
silent! set fileencoding=utf-8
if !empty(glob('~/vimfiles/autoload/pathogen.vim')) || !empty(glob('~/.vim/autoload/pathogen.vim'))
  silent! execute pathogen#infect()
  syntax on
  filetype plugin indent on
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  if has('nvim') && empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
endif
"}}}

let mapleader = "\<Space>"
silent! set macmeta

"{{{ Meta for Terminal Vim
if !has("gui_running") && !has('nvim')
  "Bind selected meta for selected keys: dbfnp<BS> hjkl vecyq 7890 ;' st
  silent! exe "set <S-Left>=\<Esc>b"
  silent! exe "set <S-Right>=\<Esc>f"
  silent! exe "set <F31>=\<Esc>d"| "M-d
  map! <F31> <M-d>
  map <F31> <M-d>
  silent! exe "set <F32>=\<Esc>n"| "M-n
  map! <F32> <M-n>
  map <F32> <M-n>
  silent! exe "set <F33>=\<Esc>p"| "M-p
  map! <F33> <M-p>
  map <F33> <M-p>
  silent! exe "set <F34>=\<Esc>\<C-?>"| "M-BS
  map! <F34> <M-BS>
  map <F34> <M-BS>
  silent! exe "set <F35>=\<Esc>\<C-H>"| "M-BS
  map! <F35> <M-BS>
  map <F35> <M-BS>
  silent! exe "set <F13>=\<Esc>h"| "M-h
  map! <F13> <M-h>
  map <F13> <M-h>
  silent! exe "set <F14>=\<Esc>j"| "M-j
  map! <F14> <M-j>
  map <F14> <M-j>
  silent! exe "set <F15>=\<Esc>k"| "M-k
  map! <F15> <M-k>
  map <F15> <M-k>
  silent! exe "set <F16>=\<Esc>l"| "M-l
  map! <F16> <M-l>
  map <F16> <M-l>
  silent! exe "set <F17>=\<Esc>v"| "M-v
  map! <F17> <M-v>
  map <F17> <M-v>
  silent! exe "set <F18>=\<Esc>e"| "M-e
  map! <F18> <M-e>
  map <F18> <M-e>
  silent! exe "set <F19>=\<Esc>c"| "M-c
  map! <F19> <M-c>
  map <F19> <M-c>
  silent! exe "set <F20>=\<Esc>y"| "M-y
  map! <F20> <M-y>
  map <F20> <M-y>
  silent! exe "set <F21>=\<Esc>q"| "M-q
  map! <F21> <M-q>
  map <F21> <M-q>
  silent! exe "set <F22>=\<Esc>7"| "M-7
  map! <F22> <M-7>
  map <F22> <M-7>
  silent! exe "set <F23>=\<Esc>8"| "M-8
  map! <F23> <M-8>
  map <F23> <M-8>
  silent! exe "set <F24>=\<Esc>9"| "M-9
  map! <F24> <M-9>
  map <F24> <M-9>
  silent! exe "set <F25>=\<Esc>0"| "M-0
  map! <F25> <M-0>
  map <F25> <M-0>
  silent! exe "set <F26>=\<Esc>;"| "M-;
  map! <F26> <M-;>
  map <F26> <M-;>
  silent! exe "set <F27>=\<Esc>'"| "M-'
  map! <F27> <M-'>
  map <F27> <M-'>
  silent! exe "set <F28>=\<Esc>s"| "M-s
  map! <F28> <M-s>
  map <F28> <M-s>
  silent! exe "set <F29>=\<Esc>t"| "M-t
  map! <F29> <M-t>
  map <F29> <M-t>
endif
if has('macunix')
  set shell=/bin/zsh
elseif has('unix')
  if executable('zsh')
    set shell=/usr/bin/zsh
  else
    set shell=/bin/bash
  endif
endif
"}}}
"{{{ Vim-Plug
silent! call plug#begin('~/.vim/plugged')
Plug 'tomtom/tcomment_vim'|              " Comment Toggling
Plug 'tpope/vim-eunuch'|                 " File Rename/Delete/Move
Plug 'markonm/traces.vim'                " Neovim's inccommand
Plug 'wellle/targets.vim'|               " Extended text editing objects
Plug 'tpope/vim-surround'|               " Effortlessly replace brackets, quotes and HTML tags
Plug 'tpope/vim-repeat'|                 " repeat vim-surround
" Plug 'drzel/vim-in-proportion'|          " Preserve split proportions when resizing vim
Plug 'junegunn/vim-peekaboo'             " Peek into register contents easily
Plug 'romainl/vim-qlist'|                " Reminder to check out how to use the quickfix list
Plug 'godlygeek/tabular'|                " Table creation
Plug 'jszakmeister/vim-togglecursor'

Plug 'andymass/vim-matchup'|             " % on steroids
let g:matchup_matchparen_status_offscreen = 0
" let g:matchup_matchparen_deferred = 1

Plug 'pacha/vem-tabline'
" if has('gui_running')
"   let g:vem_tabline_show=1
" else
"   let g:vem_tabline_show=0
" endif
let g:vem_tabline_show=1
let g:vem_tabline_multiwindow_mode=0

Plug 'moll/vim-bbye'|                    " Sane buffer closing w/o closing window
nnoremap <Leader>bd :Bdelete<CR>

Plug 'tpope/vim-fugitive'|               " Git wrapper

Plug '907th/vim-auto-save'|              " Saveless vim
nnoremap =oa :AutoSaveToggle<CR>
" let g:auto_save_events = ["CursorHold", "CursorHoldI", "TextChanged", "InsertLeave"]
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTree'] }
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <C-x><C-n> :NERDTreeToggle<CR>
let NERDTreeAutoDeleteBuffer=1 "auto-delete buffers that have been renamed, moved or deleted
let NERDTreeMouseMode=2 "directories need one click to open, files need two clicks
let NERDTreeMinimalUI=1 "hide '?' and 'bookmarks' label
let NERDTreeMapJumpNextSibling='<C-n>'
let NERDTreeMapJumpPrevSibling='<C-p>'
let NERDTreeMapPreview='<M-k>'
let NERDTreeHighlightCursorline=1
let NERDTreeHijackNetrw=1

Plug 'Yggdroot/indentLine'|              " Visual guides for indentation
let g:indentLine_enabled=1
let g:indentLine_char='¦'
let g:indentLine_color_term = 237
let g:indentLine_fileTypeExclude = ['json', 'markdown']
nnoremap <Leader>il :IndentLinesToggle<CR>

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1

Plug 'arthurxavierx/vim-caser'

Plug 'junegunn/rainbow_parentheses.vim'
function! RainbowParensHighlights() abort
  hi rainbowParensShell16 ctermfg=28 guifg=Blue3
endfunction
augroup rainbow_lisp
  autocmd!
  " autocmd ColorScheme * call RainbowParensHighlights()
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

Plug 'mbbill/undotree', {'on': ['UndotreeToggle', 'UndotreeShow']}
nnoremap <C-x><C-u> :UndotreeToggle<CR>
let g:undotree_WindowLayout=4
let g:undotree_SetFocusWhenToggle=1
let g:undotree_DiffpanelHeight=15
function! g:Undotree_CustomMap()
  nmap <buffer> <C-g> <plug>UndotreeClose
  nmap <buffer> <CR> <plug>UndotreeClose
endfunc

Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
let g:goyo_width='80%'
let g:goyo_height='100%'
augroup Goyo
  autocmd!
  autocmd User GoyoEnter set showtabline=0
augroup END

Plug 'tpope/vim-markdown', {'for': 'markdown'}
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript']

Plug '/usr/local/opt/fzf'|               " Fuzzyfinder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'|
nnoremap <C-x><C-b> :Buffers<CR>
nnoremap <C-x><C-f> :Files<CR>
nnoremap <C-c>f :History<CR>
nnoremap <Leader>hc :History:<CR>
nnoremap <Leader>ll :Lines<CR>
nnoremap <Leader>bl :BLines<CR>
if has('gui_running') "These colors are adjusted for Vim's Morning colorscheme
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'fg+':     ['fg', 'Normal'],
    \ 'bg+':     ['bg', 'CursorColumn'],
    \ 'info':    ['fg', 'Normal'],
    \ 'border':  ['fg', 'Normal'],
    \ 'prompt':  ['fg', 'Normal'],
    \ 'pointer': ['fg', 'Normal'],
    \ 'marker':  ['fg', 'Normal'],
    \ 'spinner': ['fg', 'Normal'],
    \ 'header':  ['fg', 'Constant'] } "header is the current buffername in :Buffers
endif

Plug 'romainl/vim-cool'

Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-anyblock'

Plug 'vim-scripts/ReplaceWithRegister'

Plug 'AndrewRadev/linediff.vim', {'on': 'Linediff'}
xnoremap <Leader>ld :Linediff<CR>

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'FooSoft/vim-argwrap'
nnoremap <silent> <leader>aw :ArgWrap<CR>

Plug 'rizzatti/dash.vim', {'on': 'Dash'}

Plug 'dyng/ctrlsf.vim', {'on': ['CtrlSF','<Plug>CtrlSFCwordExec','<Plug>CtrlSFVwordExec']}
nnoremap <Leader>cf :CtrlSF<Space>
nmap <Leader>sf <Plug>CtrlSFCwordExec
xmap <Leader>sf <Plug>CtrlSFVwordExec
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }
let g:ctrlsf_auto_close = {
    \ "normal" : 1,
    \ "compact": 1
    \}
let g:ctrlsf_default_view_mode = 'normal'
let g:ctrlsf_mapping = {
            \"open"    : ["<CR>", "o"],
            \"openb"   : "O",
            \"split"   : "<C-O>",
            \"vsplit"  : "",
            \"tab"     : "t",
            \"tabb"    : "T",
            \"popen"   : "p",
            \"popenf"  : "P",
            \"quit"    : "<C-g>",
            \"next"    : "<C-n>",
            \"prev"    : "<C-p>",
            \"pquit"   : "<C-g>",
            \"loclist" : "",
            \"chgmode" : "M",
            \"stop"    : "<C-C>"
            \}

Plug 'tpope/vim-ragtag'
let g:ragtag_global_maps = 1

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-z>'
nnoremap <C-z><C-z> <C-z>

Plug 'osyo-manga/vim-anzu'
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

Plug 'SirVer/ultisnips'
let g:UltiSnipsNoPythonWarning=1
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-M-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-M-b>"
let g:UltiSnipsEditSplit="context"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories = [$HOME.'.vim/UltiSnips', $HOME.'.config/nvim/UltiSnips', 'UltiSnips']

Plug 'honza/vim-snippets'

Plug 'chrisbra/Colorizer'
let g:colorizer_auto_filetype='css,html'
let g:colorizer_syntax = 1
nmap <Leader>cc <Plug>Colorizer

Plug 'JuliaEditorSupport/julia-vim'

Plug 'davidhalter/jedi-vim', {'for': 'python'}
let g:jedi#auto_vim_configuration = 0

Plug 'w0rp/ale'
let g:ale_enabled = 0
nnoremap [ae :ALEEnable<CR>
nnoremap ]ae :ALEDisable<CR>
nmap <silent> <C-c><C-n> <Plug>(ale_next_wrap)
nmap <silent> <C-c><C-p> <Plug>(ale_previous_wrap)
" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_enter = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
  \ 'php': ['langserver'],
  \ 'ocaml': ['merlin'],
  \ 'python': ['flake8'],
  \ 'sh': ['shellcheck'],
  \ 'zsh': ['shellcheck'],
  \ 'go': ['gofmt','goimports','golint','go vet'],
  \ 'javascript': ['eslint'],
  \ 'html': ['htmlhint'],
  \ 'css': ['csslint'],
  \ 'c': ['clang'],
  \ 'ruby': ['rubocop'],
  \ 'eruby': ['erb'],
  \ 'java': ['javac'],
  \}
let g:ale_set_signs = 0
" let g:ale_sign_column_always = 1

Plug 'tpope/vim-obsession'

Plug 'vim-vdebug/vdebug', {'for': 'php'}
let g:vdebug_options = {
    \'debug_file': "~/vdebug.log"
\}
function! VdebugHighlights() abort
  hi DbgBreakptLine ctermfg=15 ctermbg=22
  hi DbgBreakptSign ctermfg=15 ctermbg=22
endfunction
augroup VdebugAutocommands
  autocmd!
  autocmd ColorScheme * call VdebugHighlights()
augroup END

Plug 'captbaritone/better-indent-support-for-php-with-html', {'for': 'php'}
let php_htmlInStrings = 1

" Merlin
if !has('gui_running')
  let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
  silent! execute "set rtp+=" . g:opamshare . "/merlin/vim"
  silent! execute "helptags " . g:opamshare . "/merlin/vim/doc"
  let g:merlin_disable_default_keybindings = 1
endif

Plug 'let-def/ocp-indent-vim'

Plug 'jpalardy/vim-slime'
if empty(glob('~/.slime_paste')) && !has('win32')
  silent! !touch ~/.slime_paste
endif
let g:slime_paste_file = '~/.slime_paste'
if !has('gui_running') && $TMUX != ""
  let g:slime_target = "tmux"
  let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.1"}
elseif has('nvim')
  let g:slime_target = "neovim"
elseif !has('nvim')
  let g:slime_target = "vimterminal"
endif
let g:slime_no_mappings=1
" let g:slime_python_ipython=1
nnoremap <M-s><M-c> :let g:slime_target = "tmux"<CR>
      \:let b:slime_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":"}<CR>
      \:SlimeConfig<CR>
if has('nvim')
  tnoremap <A-s><A-c> <C-\><C-n>
        \:let g:slime_target = "neovim"<CR>
        \:let g:temp = b:terminal_job_id<CR>
        \<C-w>p
        \:let b:slime_config = {"jobid":g:temp}<CR>
endif
xmap <C-c><C-e> <Plug>SlimeRegionSend
nmap <C-c><C-e> <Plug>SlimeParagraphSend
nmap <C-c><C-s> <Plug>SlimeLineSend

Plug 'fatih/vim-go' ", { 'do': ':GoUpdateBinaries' }
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_info_mode = 'guru'
" vim-go highlights
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_fmt_autosave = 0

Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-SpellCheck'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
let g:mkdp_auto_close = 0

Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']

Plug 'https://github.com/vim-scripts/Super-Shell-Indent'

Plug 'mhinz/vim-signify'
let g:signify_vcs_list = ['git']
nnoremap <expr> <C-c><C-g> sy#repo#get_stats() != [-1,-1,-1] ?
            \!&diff ? "
            \:SignifyDiff<CR>
            \:let g:prevwin=win_getid()<CR>
            \:let b:wsv=winsaveview()<CR>
            \:windo diffoff<CR>:windo diffthis<CR>
            \:silent! call win_gotoid(g:prevwin)<CR>
            \:silent! call winrestview(b:wsv)<CR>zz
            \": ":silent! diffoff! \| silent! tabclose<CR>
            \": ""

" requires yarn to be installed
Plug 'neoclide/coc.nvim', {'for': ['javascript','php','java']}
", {'tag': '*', 'do': { -> coc#util#install()}}

Plug 'tpope/vim-rails'

Plug 'tpope/vim-dispatch'

Plug 'bokwoon95/vim-http'
let g:vim_http_tempbuffer = 1
command! -range=% JQ <line1>,<line2>!jq '.'

Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-dadbod'
let g:dadbod_manage_dbext = 1

silent! call plug#end()
"}}}

syntax enable
set hidden                     " Hide Buffers, not Kill
set autoindent                 " Autoindentation
set wildmenu                   " Show completion options in vim command line
set wildmode=list:longest,full " Bash-style completion menu
set wildignorecase             " ignore case in wildmenu
set number                     " Show line numbers
set ruler                      " Show cursor position
set laststatus=2               " Always show statusbar
set backspace=2                " Enable backspace capability
set incsearch hlsearch         " Realtime searching, and persistently highlight
set wrap linebreak             " Soft-wrap long lines without breaking words into 2
set display+=lastline          " display partial lines that have been wrapped
set showcmd                    " Show commands in minibuffer
set ignorecase smartcase       " Ignore case when searching, unless capitals are used
set ts=4 sw=4 sts=4 et         " Use soft tabs
set mouse=a                    " Enable mouse in terminal
set list                       " Show hidden characters
set listchars=tab:\|\ ,trail:· " ,eol:¬
set foldopen-=block            " Prevent { & } from opening folds
set breakindent                " wrapped lines keep same level of indent visually
silent! set inccommand=nosplit " Realtime feedback for Ex Commands (NEOVIM ONLY)
set fillchars+=vert:│          " Vertical bar separator
set matchpairs+=<:>            " % can jump between <,> pairs
set whichwrap+=[,],<,>         " <Left> & <Right> keys will wrap to prev/next line
syntax sync minlines=256       " start highlighting from 256 lines backwards
set synmaxcol=300              " do not highlight very long lines
set autoread                   " Reload files if they have been changed externally
augroup Checkt
  autocmd!
  autocmd FocusGained,BufEnter * checktime " To trigger vim's autoread on focus gained or buffer enter
augroup END
autocmd! Filetype vim setlocal foldmethod=marker ts=2 sts=2 sw=2 et
command! GMS /^<<<<<<< .*$\|^>>>>>>> .*$\|^=======$
set foldtext=repeat('\ ',indent(v:foldstart)).foldtext()
set infercase
if !empty(glob('~/.vim/words'))
  set dictionary+=~/.vim/words
  set spellfile=~/.vim/spell/en.utf-8.add
elseif !empty(glob('~/vimfiles/words'))
  set dictionary+=~/vimfiles/words
  set spellfile=~/vimfiles/spell/en.utf-8.add
endif
set spellcapcheck=

" Survival Pack
noremap <C-j> 5gj
noremap <C-k> 5gk
noremap <C-h> 4<C-y>
noremap <C-l> 4<C-e>
nnoremap <C-x>b :ls<CR>:b<Space>
cnoremap <silent> <expr> <CR> getcmdline() == "b " ? "\<C-c>:b#\<CR>" : "\<CR>"
nnoremap <C-x><C-h> :setlocal hlsearch!<bar>set hlsearch?<CR>
inoremap <expr> <C-y> !pumvisible() ? "\<C-o>mm\<C-o>:set paste\<CR>\<C-r>+\<C-o>:set nopaste\<CR>\<Esc>'[=']`mi" : "\<C-y>"
command! TL verbose setlocal ts? sts? sw? et?
command! T2 setlocal ts=2 sts=2 sw=2 et | echo "indentation set to 2 spaces"
command! T4 setlocal ts=4 sts=4 sw=4 et | echo "indentation set to 4 spaces"
command! Tb4 setlocal ts=4 sts=4 sw=4 noet | echo "indentation set to 4-spaced Tabs"
command! Spa setlocal paste
command! Sna setlocal nopaste
" Custom keybindings (:h normal-index for defaults) (:map <key> to check key's current mapping)
inoremap jk <Esc>`^| "doesn't work in terminal vim (see "Terminal Vim Settings" section)
nnoremap <Leader>vv :e $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <C-]> <NOP>
command! W execute 'silent! w !sudo tee "%" > /dev/null' <bar> edit!
"{{{ Saner Defaults
"Disable uncommonly used Ex mode, bind Q to something more useful
nnoremap Q @q
"Bind <Tab> to %
map <Tab> %
noremap M %
"Bind ^ to H, $ to L
noremap H g^
nnoremap L g$
onoremap L g$
xnoremap L g$h
"Indent blocks without losing visual mode
xnoremap < <gv
xnoremap > >gv
"Better increment and decrement operators
noremap + <C-a>
noremap - <C-x>
xnoremap g+ g<C-a>
xnoremap g- g<C-x>
"Swap U & gU
nnoremap U m`gU
nnoremap gU U
"Enter and <C-j> accepts popup menu selection
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-j> pumvisible() ? "\<C-y>" : ""
"}}}
"{{{ hjkl & movement
nnoremap <silent> h <BS>
nnoremap <silent> l <Space>
xnoremap <silent> h <BS>
xnoremap <silent> l <Space>
nnoremap <silent> <expr> k v:count == 0 ? "gk" : "k"
nnoremap <silent> <expr> j v:count == 0 ? "gj" : "j"
onoremap <silent> <expr> k gk
onoremap <silent> <expr> j gj
noremap <expr> <CR> bufname("") == "[Command Line]" ? "<CR>"  :
      \ v:count == 0 ? "<Tab>" : "Gzz"
"}}}
"{{{ Macros
nnoremap <M-;> 5zh
nnoremap <M-'> 5zl
nnoremap <Leader>ss :%s//g<Left><Left>
xnoremap <Leader>ss :s//g<Left><Left>
xnoremap <Leader>tbts :s/	/    /g<Left><Left>| "convert tab to 4 spaces for visual selection
nnoremap <Leader>tbts :%s/	/    /g<Left><Left>| "convert tab to 4 spaces in normal mode
nnoremap <Leader>rr :let b:wsv=winsaveview()<CR>
      \gg=G
      \:silent! call winrestview(b:wsv)<CR>
      \:echo 'File reindented'<CR>| "reindent file without losing cursor position
nnoremap <M-v> ^vg_| "V but w/o newline char
nnoremap yd ^yg_"_dd| "dd but w/o newline char
noremap <M-d> "_d| "Black_hole delete without saving to register
noremap Y "+y| "Copy to system clipboard in normal/visual mode
nnoremap YY "+yy| "Copy to system clipboard in normal/visual mode
nnoremap y7 m`^yg_``| "yank current line (without newline)
nnoremap Y& m`^"+yg$``| "Copy current line (without newline) to system clipboard
nnoremap <M-p> "+p| "Paste from system clipboard
nnoremap <Leader>pc :let<Space>@+=expand('%:p:h')<CR>| "copy file's directory path to clipboard
nnoremap <Leader>fc :let<Space>@+=expand('%:p')<CR>| "copy file's full path+filename to clipboard
cnoremap <C-k> <C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>| "kill from current position to EOL
cnoremap <C-y> <C-r>+
cnoremap <M-y> <C-r>"
nnoremap <Leader>ww :let b:wsv=winsaveview()<CR>
      \:let b:old_search=@/<CR>
      \:%s/\s\+$//e<CR>
      \:let @/=b:old_search<CR>
      \:silent! call winrestview(b:wsv)<CR>
      \:echo '+++ Trailing whitespaces purged +++'<CR>| "Kill all orphan whitespaces
xnoremap <silent> * :<C-u>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>| "forward search for visual selection literally (ignore regex)
nnoremap <C-M-h> <C-w>p5<C-y><C-w>p| "Scroll other window upwards (normal mode)
inoremap <C-M-h> <Esc><C-w>w5<C-y><C-w>pa| "Scroll other window upwards (insert mode)
nnoremap <C-M-l> <C-w>p5<C-e><C-w>p| "Scroll other window downwards (normal mode)
inoremap <C-M-l> <Esc><C-w>w5<C-e><C-w>pa| "Scroll other window downwards (insert mode)
"tip from https://www.reddit.com/r/vim/comments/7yn0xa/editing_macros_easily_in_vim/
fun! ChangeReg() abort
  let x = nr2char(getchar())
  call feedkeys("q:ilet @" . x . " = \<c-r>\<c-r>=string(@" . x . ")\<cr>\<esc>0f'", 'n')
endfun
nnoremap cr :call ChangeReg()<CR>| "cr<register alphabet> to edit the register
nnoremap <expr> <BS> &diff && &readonly ? ":qa!<CR>" : "<C-^>"
nnoremap <M-q> @q
" xnoremap <Leader>ttt :s/\v<\a/\u&/g<CR>| " Fast and dirty titlecasing
"^basic titlecase (does not work on anything other than all small caps)
"https://taptoe.wordpress.com/2013/02/06/vim-capitalize-every-first-character-of-every-word-in-a-sentence/
" xnoremap <Leader>ttc gugv:s/\v^\a\|\:\s\a\|<%(in>\|the>\|at>\|with>\|a>\|and>\|for>\|of>\|on>\|from>\|by>)@!\a/\U&/g<CR>
"^titlecase that excludes words in the list (also works on all types of caps by converting eveything to small caps first)
":s/\v^\a|\:\s\a|<%(in>|the>|at>|with>|a>|and>|for>|of>|on>|from>|by>)@!\a/\U&/g
"^ the bar characters must be escaped ie '\|'
nnoremap <expr> <C-x><C-r> &diff ? "
      \:let g:prevwin=win_getid()<CR>
      \:let b:wsv=winsaveview()<CR>
      \:windo diffoff<CR>:windo diffthis<CR>
      \:silent! call win_gotoid(g:prevwin)<CR>
      \:silent! call winrestview(b:wsv)<CR>
      \": ""
nnoremap <expr> <C-x><C-d> &diff ? ":diffget<CR>" : ""
cnoremap <C-j> <Down>
nnoremap gh `[v`]| "Select last pasted text
nnoremap <expr> <C-c><C-c> bufname("") == "[Command Line]" ? ":close<CR>" : ""
" cnoremap sudow w !sudo tee % >/dev/null
fun! DuplicateLineSavePosition() abort
  let colnum = virtcol('.')
  execute "normal! yyp".colnum."|"
endfun
inoremap <C-l> <Esc>:call DuplicateLineSavePosition()<CR>a<C-g>u
command! Gitmergesearch let @/="^<<<<<<< .*$\\|^>>>>>>> .*$\\|^=======$"
fun! Checkt(...) abort
  let checkt_all = a:0 >= 1 ? a:1 : 0
  if checkt_all==1
    let currbufnr = bufnr("%")
    silent! bufdo checktime
    execute "buffer" . currbufnr
  else
    silent! checktime
  endif
  echo "+++ Buffer Refreshed +++"
endfun
command! EE call Checkt()
command! EA call Checkt(1)
fun! Bufdo(cmd) abort
  let currbufnr = bufnr("%")
  execute "bufdo " . a:cmd
  execute "buffer" . currbufnr
endfun
command! -nargs=1 -complete=command Bufdo silent call Bufdo(<q-args>)
xmap <S-Tab> %
inoremap <C-g><C-d> <C-d>| "C-t indents, C-g C-d de-indents in insert mode
command! Timestamps %s/^\s*\zs\(\d\{10}\)/\=strftime('%c', submatch(1))/g
"}}}
"{{{ Wildmenu Macros
nnoremap <M-e> :e<Space><C-d>
cnoremap <M-e> <Home><S-Right><C-w>e<End><C-d>
nnoremap <M-c>d :cd<Space><C-d>
cnoremap <M-c>d <Home><S-Right><C-w>cd<End><C-d>
cnoremap %% <Home><S-Right><S-Right><C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
      \<C-r>=expand('%:h').'/'<CR><C-d>
cnoremap <M-h> <Home><S-Right><Right><C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
      \~/<C-d>
cnoremap <M-d>k <Home><S-Right><Right><C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
      \~/Desktop/<C-d>
cnoremap <M-v>im <Home><S-Right><Right><C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
      \~/.vim/<C-d>
cnoremap <M-d>oc <Home><S-Right><Right><C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
      \~/Documents/<C-d>
cnoremap <M-d>bo <Home><S-Right><Right><C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
      \~/Dropbox/<C-d>
cnoremap <M-d>dc <Home><S-Right><Right><C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
      \~/Dropbox/Documents/<C-d>
cnoremap <M-d>w <Home><S-Right><Right><C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
      \~/Downloads/<C-d>
nnoremap <Leader>nv :e<Space>~/.config/nvim/init.vim<CR>
nnoremap <Leader>iv :e<Space>~/.vim/vimrc<CR>
"}}}
"{{{ UTF8 Macros
inoremap <M-q><M-a> <C-v>u25c6<Space>| "◆ Db
inoremap <M-q><M-b> <C-v>u2022<Space>| "•
  inoremap <M-q>b <C-v>u2022<Space>| "•
inoremap <M-q><M-c> <C-v>u25e6<Space>| "◦
inoremap <M-q><M-d> <C-v>u25c7<Space>| "◇ Dw
inoremap <M-q><M-l> <C-v>u2502| "│ vv
inoremap <M-q><M-=> <C-v>u2713| "✓ OK
inoremap <M-q><M--> <C-v>u2717| "✗ XX
" ▸ u25b8
" ▹ u25b9
" ■ u25a0
" □ u25a1
":h digraph-table for a list of utf8 digraphs you can insert in vim
"}}}
"{{{ Buffer Management
nnoremap <C-s> :bn<CR>
nnoremap <C-q> :bp<CR>
nnoremap gb :buffers<CR>:buffer<Space>
" nnoremap <Leader>xbd :bp<bar>bd#<CR>| "bd w/o closing window
if !empty(globpath(&rtp, 'plugin/vem_tabline.vim'))
  if g:vem_tabline_show == 1
    nmap <Leader><Down> <Plug>vem_move_buffer_right-
    nmap <Leader><Up> <Plug>vem_move_buffer_left-
    nmap <Leader><Right> <Plug>vem_next_buffer-
    nmap <Leader><Left> <Plug>vem_prev_buffer-
    nmap <S-Down> <Plug>vem_move_buffer_right-
    nmap <S-Up> <Plug>vem_move_buffer_left-
    nmap <C-s> <Plug>vem_next_buffer-
    nmap <C-q> <Plug>vem_prev_buffer-
  endif
endif
"}}}
"{{{ Tab Management
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>te :tabedit<Space>%<CR><C-o>
"}}}
"{{{ Window Management
set splitright splitbelow " Prefer opening new splits to the right and below
nnoremap <expr> <C-w><C-q> &diff ? ":diffoff!<Bar>close<CR>" : "<C-w>c"
nnoremap <expr> <C-w><C-c> &diff ? ":diffoff!<Bar>close<CR>" : "<C-w>c"
nnoremap <expr> <C-w>c &diff ? ":diffoff!<Bar>close<CR>" : "<C-w>c"
nnoremap <expr> <C-w><C-o> &diff ? ":diffoff!<Bar>only<CR>" : "<C-w>o"
nnoremap <C-w><C-e> :enew<CR>
nnoremap <M-7> <C-w><
nnoremap <M-0> <C-w>>
nnoremap <M-8> <C-w>-
nnoremap <M-9> <C-w>+
nnoremap <M-(> 200<C-w>+
nnoremap <M-j> <C-w><C-j>
nnoremap <M-k> <C-w><C-k>
nnoremap <M-l> <C-w><C-l>
nnoremap <M-h> <C-w><C-h>
nnoremap <M-\> <C-w><C-p>
if !empty(globpath(&rtp, 'plugin/tmux_navigator.vim'))
  nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
  nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
  nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
  nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
  nnoremap <silent> <M-\> :TmuxNavigatePrevious<CR>
  inoremap <silent> <M-h> <C-o>:TmuxNavigateLeft<CR>
  inoremap <silent> <M-j> <C-o>:TmuxNavigateDown<CR>
  inoremap <silent> <M-k> <C-o>:TmuxNavigateUp<CR>
  inoremap <silent> <M-l> <C-o>:TmuxNavigateRight<CR>
  inoremap <silent> <M-\> <C-o>:TmuxNavigatePrevious<CR>
endif
"}}}
"{{{ Emacs Emulation
nnoremap <C-c> <NOP>| "Disable default C-c behavior to use it for custom mappings
nnoremap <C-x> <NOP>| "Disable default C-x behavior to use it for custom mappings
cnoremap <expr> <C-g> getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<C-g>" : "<C-c><Esc>"
nnoremap <expr> <C-g> bufname("") =~ "NERD_tree_\\d"  ? ":NERDTreeToggle<CR>" :
      \ bufname("") == "[Command Line]" ? ":close<CR>" :
      \ &filetype == "godoc" ? ":close<CR>" :
      \ getwininfo(win_getid())[0]['quickfix'] ? ":cclose<CR>" :
      \ getwininfo(win_getid())[0]['loclist'] ? ":lclose<CR>" : "<C-g>"
" see :h expression-syntax for why =~ over ==
"undo
inoremap <C-_> <C-o>u<C-o>u
inoremap <CR> <C-g>u<CR>
"movement
inoremap <C-b> <Left>
inoremap <expr> <C-n> pumvisible() ? "<Down>": "<C-o>gj"
inoremap <expr> <C-p> pumvisible() ? "<Up>": "<C-o>gk"
inoremap <expr> <C-M-n> pumvisible() ? "<Down><Down><Down>": "<C-o>5gj"
inoremap <expr> <C-M-p> pumvisible() ? "<Up><Up><Up>": "<C-o>5gk"
inoremap <C-f> <Right>
inoremap <M-f> <S-Right>
inoremap <M-b> <S-Left>
inoremap <C-a> <C-c>I
inoremap <C-e> <End>
"forward delete, backward delete & character delete
inoremap <M-d> <C-g>u<C-o>vec<C-g>u
inoremap <M-BS> <C-g>u<C-w><C-g>u
inoremap <C-BS> <C-g>u<C-w><C-g>u
inoremap <C-w> <C-g>u<C-w><C-g>u
inoremap <C-d> <Del>
"kill to EOL, kill to SOL, and kill entire line
inoremap <C-k> <C-o>D
inoremap <C-M-k> <C-k>| "C-M-k replaces C-k for entering digraphs
"save
inoremap <C-x><C-s> <C-o>:w<CR>
nnoremap <C-x><C-s> :w<CR>
"paste from vim register
inoremap <M-y> \<C-o>:set paste\<CR>\<C-r>"\<C-o>:set nopaste\<CR>
"emacs misc
nnoremap <C-x><C-c> :wqa<CR>
nnoremap <C-x><C-x><C-c> :qa!<CR>
nnoremap <C-x>f :e<Space><C-r>=expand('%:h').'/'<CR><C-d>
nnoremap <C-c>l :e $MYVIMRC<CR>
nnoremap <C-x><C-k> :ls<CR>:bd<Space>
nnoremap <C-x>k :ls<CR>:bd!<Space>
"commandline bindings
cnoremap <C-a> <Home>
cnoremap <C-b> <End>
cnoremap <C-M-f> <S-Right>
cnoremap <C-M-b> <S-Left>
"}}}
"{{{ Vim Unimpaired
"Insert space above and below
" function! s:BlankUp(count) abort
"   put!=repeat(nr2char(10), a:count)
"   ']+1
"   silent! call repeat#set("\<Plug>unimpairedBlankUp", a:count)
" endfunction
" function! s:BlankDown(count) abort
"   put =repeat(nr2char(10), a:count)
"   '[-1
"   silent! call repeat#set("\<Plug>unimpairedBlankDown", a:count)
" endfunction
" nnoremap <silent> [<Space> :<C-U>call <SID>BlankUp(v:count1)<CR>
" nnoremap <silent> ]<Space> :<C-U>call <SID>BlankDown(v:count1)<CR>
"
" "Settings
" nnoremap [ol :setlocal list<CR>
" nnoremap ]ol :setlocal nolist<CR>
" nnoremap [oh :setlocal hlsearch<CR>
" nnoremap ]oh :setlocal nohlsearch<CR>
" inoremap <C-x><C-h> <C-o>:setlocal hlsearch!<bar>set hlsearch?<CR>
" nnoremap [os :setlocal spell<CR>
" nnoremap ]os :setlocal nospell<CR>
" nnoremap [od :diffthis<CR>
" nnoremap ]od :diffoff<CR>
nnoremap [wd :let g:prevwin=win_getid()<CR>
      \:let b:wsv=winsaveview()<CR>
      \:windo diffthis<CR>
      \:silent! call win_gotoid(g:prevwin)<CR>
      \:silent! call winrestview(b:wsv)<CR>
nnoremap ]wd :let b:wsv=winsaveview()<CR>
      \:diffoff!<CR>
      \:silent! call winrestview(b:wsv)<CR>
" nnoremap [on :setlocal number<CR>
" nnoremap ]on :setlocal nonumber<CR>
" nnoremap [oc :setlocal cursorline<CR>
" nnoremap ]oc :setlocal nocursorline<CR>
" nnoremap [ov :setlocal virtualedit=all<CR>
" nnoremap ]ov :setlocal virtualedit=<CR>
" nnoremap [b :bprev<CR>
" nnoremap ]b :bnext<CR>
" nnoremap [l :lprevious<CR>
" nnoremap ]l :lnext<CR>
" nnoremap [q :cprevious<CR>
" nnoremap ]q :cnext<CR>
"}}}
"{{{ Vim Tips
" To apply macros to multiple lines, highlight the lines and :norm!@@
" v/foo/e will jump the visual selection to the next instance of foo (without incsearch)
"   v/foo if you have incsearch. You can <C-g> & <C-t> to jump to the next/previous instance of foo
" <C-g> in normal mode will show the full path for the current file
" g<C-g> in a visual selection will print line/char/byte count of selection
" ga or g8 will show ascii/utf8 code of current character
" <C-f> in commandline mode will open a new editable window in normal mode
"   this also allows you to view your past search/command history
" Yank to a Capital letter register (eg A instead of a) to append to it, rather than overwriting it
" <C-w>[number]| resizes a window's columns to that number, use '-' for height
" <C-w><C-x> swaps the position of the current and alternate window
" <C-o>[number]i[character] will insert [character] [number] amount of times in the same line while in insert mode. Skip <C-o> if you start in normal mode
" :set bl to set buflisted an unlisted buffer (such as help files)
" :scriptnames to see loaded script order
" :map to see your loaded keymappings
" :command to see loaded commands
" :registers to see your registers
" :oldfiles to see your previously opened files
" using an empty pattern with :s e.g. :s//<whatever>/g will use the last search result with / as your pattern instead
" yl to copy current character under cursor (instead of vy)
" <C-d> in commandline mode to reveal all available options (like with wildmenu)
" RSs,HML,Z<as prefix>,Q,U,+-_,<Space><BS><CR> are all (uncommonly) used keys (or keys with commonly used equivalents) safe for rebinding
" <C-g> & <C-t> will jump to next/previous term while searching without having to press Enter
" echo winwidth(0) to get the current window width (same for height)
" :cq to exit vim with abnormal exit status, useful to abort git commit messages
" <C-x><C-l> in insert mode to autocomplete entire lines present in the buffer
" :%s/^/\=printf('%03d', line('.')) create a padded column of incrementing numbers
" You can pipe the regex matches from :global into :substitute!
" vim --startuptime vim.log to profile your vim startup
" \_. is the turbo version of . which matches newline characters, allowing for regex matching over multiple lines
" :redir @<register> to start recording Ex command outputs to <register>, :redir END to stop
" To specify a case sensitive search pattern, append '\C'. (conversely, '\c' for a case insensitivite pattern)
"}}}
"{{{ iabbreviations nonrecursive
"The double backslash is needed so vim doesn't complain
inoreabbr \lambda\ λ<C-r>=Eatchar('\m\s\<Bar>/')<CR>
inoreabbr \time\ <C-r>=strftime("%d-%b-%Y @ %H:%M")<CR><C-r>=Eatchar('\m\s\<Bar>/')<CR>
inoreabbr \date\ <C-r>=strftime("%d-%b-%Y")<CR><C-r>=Eatchar('\m\s\<Bar>/')<CR>
"}}}
"{{{ Views
set viewoptions=folds "let vop save only folds, and nothing else
fun! Makeview(...) abort
  let b:force_makeview = a:0 >= 1 ? a:1 : 0
  let b:viewfolder = expand('%:p:h') . "/.v__views"
  let b:viewfile = b:viewfolder . "/v__" . expand('%:t:r') . expand('%:e')
  if filereadable(b:viewfile) || b:force_makeview==1
    if b:force_makeview==1 "I suspect this is a bug that the cursor keeps gg-ing
      execute "execute mkdir('" . b:viewfolder . "', 'p')"
    endif
    let w:v = winsaveview()
    execute "mkview! ".b:viewfile
    execute "keepalt vsplit ".b:viewfile."| 3d _| w| bd"
    if b:force_makeview==1
      echo "saved view in ".b:viewfile
    endif
    call winrestview(w:v)
  endif
endfun
fun! Loadview(...) abort
  let b:force_loadview = a:0 >= 1 ? a:1 : 0
  let b:viewfolder = expand('%:p:h') . "/.v__views"
  let b:viewfile = b:viewfolder . "/v__" . expand('%:t:r') . expand('%:e')
  if filereadable(b:viewfile)
    execute "silent! source ".b:viewfile
    if b:force_loadview==1
      echo "viewfile loaded from: ".b:viewfile
    endif
  else
    " this else conditional is for debugging purposes
    echo "viewfile not found in: ".b:viewfile
  endif
endfun
command! Mkview call Makeview(1)
command! MKV call Makeview(1)
command! LDV call Loadview(1)
augroup AutosaveView
  autocmd!
  au BufWrite,VimLeave * silent! call Makeview()
  " au BufWinLeave,VimLeave * silent! call Makeview()
  "    ^^^using bufwinleave triggers some buffer deleted unexpectedly by autocmd error
  au BufRead * silent! call Loadview()
augroup END
"}}}

" Set swap & undo file directory
" if isdirectory(expand("~/.vim/.swp"))
"   set directory^=~/.vim/.swp//
" endif
set noswapfile
if !&swapfile && !empty(globpath(&rtp, 'plugin/AutoSave.vim'))
  set updatetime=1000
endif
" if isdirectory(expand("~/.vim/.undo"))
"   set undofile
"   set undodir^=~/.vim/.undo//
"   set undolevels=100000 " Maximum number of undos
"   set undoreload=100000 " Save complete files for undo on reload if it has fewer lines
" endif

"{{{ MyHighlights
function! MyHighlights() abort
  if has('gui_running') && g:colors_name == 'onedark'
    hi VertSplit cterm=none ctermfg=103 ctermbg=none gui=none guifg=#5C6370 guibg=bg
    hi EndOfBuffer ctermfg=16 guifg=bg
    hi StatusLine   ctermfg=233  ctermbg=103 cterm=bold gui=bold guibg=#21262d
    hi StatusLineNC ctermfg=103 ctermbg=none cterm=none,underline guibg=bg gui=underline
    hi SignColumn ctermbg=none
    hi TabLineSel cterm=bold,underline ctermbg=16 ctermfg=7 gui=bold,underline
  else
    hi Visual ctermbg=10 ctermfg=0
    hi DiffAdd cterm=none ctermfg=232 gui=none guifg=black
    hi DiffChange cterm=none ctermfg=232 gui=none guifg=black
    hi DiffDelete cterm=none ctermfg=232 gui=none guifg=black
    hi DiffText cterm=none ctermfg=232 gui=none guifg=black
    hi TabLineFill cterm=bold ctermbg=none gui=none guibg=bg
    hi TabLineSel cterm=bold,underline ctermbg=16 ctermfg=7 guibg=bg guifg=black gui=bold,underline
    hi TabLine cterm=none ctermbg=none ctermfg=246 guibg=bg guifg=#8787af gui=none
    hi VemTablineShown cterm=none ctermbg=16 ctermfg=7 guibg=bg guifg=black
    hi Folded cterm=none ctermbg=none gui=none guibg=bg
    hi Search ctermfg=232 ctermbg=10 guifg=black guibg=Cyan1
    hi IncSearch cterm=none ctermfg=232 ctermbg=9
    hi VertSplit cterm=none ctermfg=103 ctermbg=none gui=none guifg=#000000 guibg=#e4e4e4
    hi EndOfBuffer ctermfg=16 guifg=bg
    hi MatchParen cterm=underline ctermbg=none gui=underline guibg=bg
    hi CursorLine cterm=none ctermbg=17
    hi Cursor gui=reverse guibg=bg
    hi StatusLine   ctermfg=233  ctermbg=103 cterm=bold gui=bold guibg=#bcbcbc
    hi StatusLineNC ctermfg=103 ctermbg=none cterm=none,underline guibg=bg gui=underline
    hi SpellBad ctermbg=234 ctermfg=15 cterm=bold,underline
    hi SpellCap ctermbg=234 ctermfg=14 cterm=underline
    hi ALEErrorLine cterm=bold,underline
    hi SignColumn ctermbg=none guibg=bg
    hi ColorColumn ctermbg=234 guibg=grey85
    hi SpecialKey term=bold ctermfg=237 guifg=Grey70
    hi Whitespace term=bold ctermfg=237 guifg=Grey70
    " Plugins
    hi ALEErrorLine cterm=bold,underline
    highlight SignifySignAdd    cterm=bold ctermbg=none  ctermfg=green
    highlight SignifySignDelete cterm=bold ctermbg=none  ctermfg=red
    highlight SignifySignChange cterm=bold ctermbg=none  ctermfg=blue
  endif
endfunction
fun! RestoreCursorPosition() abort
  if &ft =~ 'gitcommit\|gitcommit'
    return
  endif
  call setpos(".", getpos("'\""))
endfun
augroup Autocommands
  autocmd!
  autocmd ColorScheme * call MyHighlights()
  autocmd BufReadPost * call RestoreCursorPosition()
  " autocmd CmdlineEnter * setlocal cursorline
  " autocmd CmdlineLeave * setlocal nocursorline
  " autocmd CmdlineLeave * if bufname("") =~ "NERD_tree_\\d" | setlocal cursorline | endif
  " autocmd CmdlineLeave * if bufname("") != "NERD_tree_\\d" | setlocal nocursorline | endif
  " autocmd BufEnter NERD_tree_* setlocal cursorline
  " autocmd BufLeave NERD_tree_* setlocal nocursorline
  autocmd BufNewFile,BufRead *.fish setlocal filetype=fish
  autocmd BufNewFile,BufRead *.ejs setlocal filetype=html
  autocmd BufNewFile,BufRead *.vue setlocal filetype=html
  autocmd BufEnter,BufLeave * if &buftype ==# 'terminal' | let g:t_bufnum = expand('<abuf>') | endif
  autocmd CompleteDone * pclose
augroup END
"}}}
"{{{ GUI Vim Settings
if has('gui_running')
  colorscheme morning
  set laststatus=1
  set guioptions=
  set belloff=all
  if has('macunix')
    set linespace=1
    " set guifont=Source\ Code\ Pro:h12
    set guifont=Go\ Mono:h12
  elseif has('unix')
    set guifont=DejaVu\ Sans\ Mono\ Book
    set lines=40 columns=150
  elseif has('win32')
    if !empty(globpath(&rtp, 'colors/onedark.vim'))
      colorscheme onedark
    endif
    set guifont=Consolas:h10
    set linespace=0
    set lines=45 columns=160
  endif
endif
"}}}
"{{{ Terminal Vim Settings
if !has("gui_running")
  colorscheme default
  set background=light
  if has('nvim')
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
          \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
          \,sm:block-blinkwait175-blinkoff150-blinkon175
    silent! lang en_US.UTF-8
  else
    set ttimeoutlen=10
  endif
endif
"}}}
"{{{ WSL Clipboard Support
func! GetSelectedText()
  normal gv"xy
  let result = getreg("x")
  return result
endfunc
if !has("gui_running") && executable("clip.exe")
  xnoremap Y :call system('clip.exe', GetSelectedText())<CR>
  nnoremap YY "xyy:call system('clip.exe', GetSelectedText())<CR>
  nnoremap Y& m`^"xyg$``:call system('clip.exe', GetSelectedText())<CR>
endif
"}}}
"{{{ Statusline Settings statsett
set statusline=
set statusline+=%{has('nvim')?'[':'('}                 " [(
set statusline+=%{strlen(&ft)?&ft:'none'},             " Filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc},           " Encoding
set statusline+=%{&fileformat}                         " File format (dos, unix)
set statusline+=%{has('nvim')?']':')'}                 " ])
set statusline+=\ %f                                   " t filename, f relative filepath, F absolute filepath
set statusline+=%{&modified?'\ +':''}                  " Show '+' when file has been modified
set statusline+=%{&readonly?'\ [RO]':''}               " Show 'RO' when file is in readonly
set statusline+=%{!&modifiable?'\ [noma]':''}          " Show 'noma' when file is nonmodifiable
set statusline+=%=                                     " Right align
set statusline+=\ %{exists('g:loaded_obsession')?ObsessionStatus():''} " Obsession status
set statusline+=\ %{exists('g:loaded_fugitive')?fugitive#head(7):''}    " Git branch
set statusline+=\ %(%l,%c%V%)                          " Show line, column, virtual column (denoted with a '-' in front)
set statusline+=\ %3p%%\                               " Percentage of file shown
set statusline+=%{has('nvim')?'[':'('}                 " [(
set statusline+=%(%{'help'!=&filetype?bufnr('%'):''}%) " Buffer number
set statusline+=%{has('nvim')?']':')'}                 " ])
"}}}

"{{{ Vim Functions
"{{{ Nr2Bin
" The function Nr2Bin() returns the binary string representation of a number
func! Nr2Bin(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '01'[n % 2] . r
    let n = n / 2
  endwhile
  return r
endfunc
"}}}
"{{{ /search suggestions
" function! s:search_mode_start()
"     cnoremap <buffer> <Tab> <C-f>a<C-n>
"     let s:old_complete_opt = &completeopt
"     set completeopt-=noinsert
" endfunction
" function! s:search_mode_stop()
"     let &completeopt = s:old_complete_opt
" endfunction
" augroup SearchSuggestions
"   autocmd!
"   silent! cunmap <Tab>
"   autocmd CmdlineEnter /,\? call <SID>search_mode_start()
"   autocmd CmdlineLeave /,\? call <SID>search_mode_stop()
" augroup END
"}}}
"{{{ TrimEndLines
function! TrimEndLines()
  let save_cursor = getpos(".")
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction
command! TrimEndLines call TrimEndLines()
"}}}
"{{{ Consume iabbr trailing space
"https://stackoverflow.com/questions/11858927/preventing-trailing-whitespace-when-using-vim-abbreviations
function! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunction
"}}}
"{{{ Redir
" https://gist.github.com/romainl/eae0a260ab9c135390c30cd370c20cd7
function! Redir(cmd)
  for win in range(1, winnr('$'))
    if getwinvar(win, 'scratch')
      execute win . 'windo close'
    endif
  endfor
  if a:cmd =~ '^!'
    let output = system(matchstr(a:cmd, '^!\zs.*'))
  else
    redir => output
    execute a:cmd
    redir END
  endif
  vnew
  let w:scratch = 1
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nonumber
  call setline(1, split(output, "\n"))
endfunction
command! -nargs=1 -complete=command Redir silent call Redir(<q-args>)
" Usage:
" 	:Redir hi ............. show the full output of command ':hi' in a scratch window
" 	:Redir !ls -al ........ show the full output of command ':!ls -al' in a scratch window
"}}}
"}}}

"{{{ :terminal settings
tnoremap <C-\><C-\> <C-\><C-n>
augroup Terminal
  autocmd!
  if has('nvim')
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen,BufWinEnter,WinEnter * if &buftype == 'terminal' |startinsert| endif
  else
    autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' |silent! normal i| endif
  endif
augroup END
nnoremap <expr> q &buftype == "terminal" ? "i" : "q"
fun! Term(...) abort
  let name =
        \(a:0 > 0 && a:1 != "")   ? "term:" . a:1  :
        \exists("g:lasttermname") ? g:lasttermname :
        \"term:shell"
  if bufwinnr(name) > 0
    execute bufwinnr(name) . "wincmd c"
  else
    15split
    if bufexists(name)
      execute "buffer " . name
    else
      if has('nvim')
        terminal
      else
        terminal ++curwin
      endif
      execute "file " . name
    endif
    let g:lasttermname = name
  endif
endfun
fun! s:termnames(ArgLead, CmdLine, CursorPos) abort
  let g:termnames = []
  for bn in range(1,bufnr('$'))
    if bufname(bn) =~# "term:.*" && bufloaded(bn)
      call add(g:termnames, bufname(bn)[5:-1])
    endif
  endfor
  return filter(g:termnames, 'v:val =~ "^'. a:ArgLead .'"')
endfun
fun! s:term(...) abort
  let name = (a:0 > 0 && a:1 != "") ? a:1  : ""
  if exists("g:lasttermname") && bufwinnr(g:lasttermname) > 0
    execute bufwinnr(g:lasttermname) . "wincmd c"
  endif
  silent call Term(name)
endfun
command! -nargs=? -complete=customlist,s:termnames Term silent call Term(<f-args>)
command! -nargs=? -complete=customlist,s:termnames T silent call s:term(<f-args>)
command! -nargs=? -complete=customlist,s:termnames TT silent call Term(<f-args>)
nnoremap <C-w><C-t> :call Term()<CR>
tnoremap <C-w><C-t> <C-\><C-n>:call Term()<CR>
"}}}
"{{{ Neovim :terminal Settings
if has('nvim')
  highlight TermCursor ctermfg=1 guifg=1
  "{{{Escaping, Renaming & Opening Terminal Buffers
  tnoremap <F2> <C-\><C-n>:NERDTreeToggle<CR>
  tnoremap <C-x><C-n> <C-\><C-n>:NERDTreeToggle<CR>
  "}}}
  "{{{Buffer Management in Terminal Buffers
  tnoremap <C-s> <C-\><C-n>:bn<CR>
  tnoremap <C-q> <C-\><C-n>:bp<CR>
  tnoremap <C-x><C-b> <C-\><C-n>:Buffers<CR>
  tnoremap <C-x>b <C-\><C-n>:ls<CR>:b<Space><C-d>
  tnoremap <C-x><C-f> <C-\><C-n>:Files<CR>
  tnoremap <C-x>f <C-\><C-n>:e<Space>
  tnoremap <A-p> <C-\><C-n>:Files<CR>
  "}}}
  "{{{Window Management in Terminal Buffers
  tnoremap <A-w> <C-\><C-n><C-w>
  tnoremap <C-w> <C-\><C-n><C-w>
  tnoremap <C-w><C-w> <C-w>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  if !empty(globpath(&rtp, 'plugin/tmux_navigator.vim'))
    tnoremap <silent> <A-h> <C-\><C-n>:TmuxNavigateLeft<CR>
    tnoremap <silent> <A-j> <C-\><C-n>:TmuxNavigateDown<CR>
    tnoremap <silent> <A-k> <C-\><C-n>:TmuxNavigateUp<CR>
    tnoremap <silent> <A-l> <C-\><C-n>:TmuxNavigateRight<CR>
    tnoremap <silent> <A-\> <C-\><C-n>:TmuxNavigatePrevious<CR>
  endif
  tnoremap <A-7> <C-\><C-n><C-w><
  tnoremap <A-0> <C-\><C-n><C-w>>
  tnoremap <A-8> <C-\><C-n><C-w>-
  tnoremap <A-9> <C-\><C-n><C-w>+
  "}}}
  "{{{Tab Management in Terminal Buffers
  tnoremap <A-t><A-a><A-e> <C-\><C-n>:tabe %<CR>
  tnoremap <A-t><A-a><A-c> <C-\><C-n>:tabc<CR>
  tnoremap <A-[> <C-\><C-n>gT
  tnoremap <A-]> <C-\><C-n>gt
  "}}}
  tnoremap <C-^> <C-\><C-n>:e<Space>#<CR>| "switch from terminal to prev buffer
  tnoremap <M-z> pwd\|pbcopy<CR><C-\><C-n>:cd <C-r>+<CR>i| "make vim CWD same as terminal CWD
  tnoremap <M-e> <C-\><C-n>:e<Space>
  tnoremap <M-;> <C-\><C-n>:
  let $FZF_DEFAULT_OPTS .= ' --no-height --bind=ctrl-j:preview-down,ctrl-k:preview-up'
endif
"}}}
"{{{ Vim8 :terminal Settings
if !has('nvim')
  silent! tnoremap <c-w><c-[> <c-\><c-n>
  silent! nnoremap <expr> <c-w><c-i> &buftype ==# 'terminal' ? "i" : ""
  silent! nnoremap <expr> <c-w><c-a> &buftype ==# 'terminal' ? "a" : ""
  silent! tnoremap <c-x><c-b> <c-\><c-n>:ls<cr>:b<space>
  silent! tnoremap <c-q> <c-\><c-n>:bp<cr>
  silent! tnoremap <c-s> <c-\><c-n>:bn<cr>
  silent! cnoreabbrev termm term ++curwin
  hi! link StatusLineTerm   StatusLine
  hi! link StatusLineTermNC StatusLineNC
endif
"}}}
