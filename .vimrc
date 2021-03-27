" Header {
" vim: set sw=4 sts=4 foldmarker={,} foldlevel=0 foldmethod=marker:
" }
" Basic {
    set nocompatible        " must be first line
    set encoding=utf-8
    let $LANG = "en_US.UTF-8"
    set langmenu=en_US.UTF-8
    set nrformats-=octal

    set nocompatible               " be iMproved
    filetype off                   " required!

    " Disable python3 warnings
    if has('python3')
      silent! python3 1
    endif
" }
" Plugins {
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
    call plug#begin('~/.vim/plugged')

    """ Functionality
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'w0rp/ale'
    Plug 'ervandew/supertab'
    Plug 'mattn/emmet-vim'
    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    " Close parathesis etc
    Plug 'raimondi/delimitmate'
    " Close html tags
    Plug 'alvan/vim-closetag'
    " Fuzzy find
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    """ Languages
    Plug 'moll/vim-node',
    Plug 'pangloss/vim-javascript'
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'mxw/vim-jsx'
    Plug 'epilande/vim-es2015-snippets'
    Plug 'epilande/vim-react-snippets'

    """ Visual
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'flazz/vim-colorschemes'
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
    Plug 'altercation/vim-colors-solarized'
    "Plug 'luochen1990/rainbow'
    Plug 'bounceme/poppy.vim'

    """ Autocomplete
    " deoplete
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

    " Initialize plugin system
    call plug#end()
"}
" General {
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    set background=dark     " Assume a dark background
    colorscheme gruvbox                 " Set colorscheme

    if has ('x') && has ('gui') " On Linux use + register for copy-paste
        set clipboard=unnamedplus
    elseif has ('gui')          " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif

    " Always switch to the current file directory
    "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

    set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set shortmess+=A                    " Dont ask when swap file exist
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set nospell                         " Disable spell check
    set hidden                          " Allow buffer switching without saving
    set noerrorbells
    set novisualbell

    " Setting up the directories {
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif
    " }
" } General
" Vim UI {
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    set cursorline                  " Highlight current line

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set relativenumber              " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set wildignore+=**/node_modules/** 
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set foldmethod=syntax           " Set foldmethod to syntax
    set foldlevelstart=20
    " Use the same symbols as TextMate for tabstops and EOLs
    set listchars=tab:▸\ ,eol:¬,trail:.,extends:#,nbsp:.
    set completeopt-=preview

" }
" GUI Settings {
    if has('gui_running')
        set guioptions-=T           " remove the toolbar
        set guioptions-=m           " remove the menubar
        set lines=40                " 40 lines of text instead of 24,
        if has("gui_gtk2")
            set guifont=Monospace\ 9
        elseif has("win32")
            set guifont=Consolas:h9:cANSI
        else
            set macligatures
            set guifont=FuraCode\ Nerd\ Font:h12
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif
"}
" Formatting {

    set nowrap                      " Wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=2                " Use indents of 2 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=2                   " An indentation every four columns
    set softtabstop=2               " Let backspace delete indent
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,php,javascript,javascript.jsx,python,twig,xml,yml,ocn autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" }
" Key (re)Mappings {
    let mapleader = ','

    " Easier moving in tabs and windows
    " The lines conflict with the default digraph mapping of <C-K>
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " The following two lines conflict with moving to top and
    " bottom of the screen
    map <S-H> gT
    map <S-L> gt

    " Stupid shift key fixes
    if has("user_commands")
        command! -bang -nargs=* -complete=file E e<bang> <args>
        command! -bang -nargs=* -complete=file W w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Q q<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
    endif

    cmap Tabe tabe

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    " Toggle search highlighting
    nmap <silent> <leader>/ :set invhlsearch<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Fix home and end keybindings for screen, particularly on mac
    " - for some reason this fixes the arrow keys too. huh.
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " Easier horizontal scrolling
    map zl zL
    map zh zH

    " Remap esc
    inoremap jk <Esc>

    " Remap fold toggle
    noremap <space> za

    " Remap search button
    noremap - /

    " Easy save
    noremap <leader>w :w<CR>

    " Easy save
    noremap <leader>W :w!<CR>

    " Clipboard stuff
    noremap <leader>y "*y
    noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
    noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>

    " Make backspace work sanely in visual mode
    vnoremap <bs> x

    " Keep search matches in the middle of the window.
    nnoremap n nzzzv
    nnoremap N Nzzzv

    " Same when jumping around
    nnoremap g; g;zz
    nnoremap g, g,zz

    " Toggle "keep current line in the center of the screen" mode
    nnoremap <leader>C :let &scrolloff=999-&scrolloff<cr>

    " Tab remaps {
        " tab navigation like firefox
        "nnoremap <C-S-tab> :tabprevious<CR>
        "nnoremap <C-tab>   :tabnext<CR>
        nnoremap <C-t>     :tabnew<CR>
        "inoremap <C-S-tab> <Esc>:tabprevious<CR>i
        "inoremap <C-tab>   <Esc>:tabnext<CR>i
        inoremap <C-t>     <Esc>:tabnew<CR>

        "nnoremap th  :tabfirst<CR>
        "nnoremap tj  :tabnext<CR>
        "nnoremap tk  :tabprev<CR>
        "nnoremap tl  :tablast<CR>
        "nnoremap tt  :tabedit<Space>
        "nnoremap tn  :tabnext<Space>
        "nnoremap tm  :tabm<Space>
        "nnoremap td  :tabclose<CR>
        "nnoremap <silent> <C-b> :CtrlPMRU<CR>
        "
    " }

    " Shortcut to rapidly toggle `set list`
    nmap <leader>l :set list!<CR>

    " Quick vimrc editing
    nnoremap <leader>em :e $MYVIMRC<cr>
    nnoremap <leader>sm :so $MYVIMRC<cr>

    " Easier help navigation on norwegian keyboard layout
    nnoremap <leader>hg <C-]>
    nnoremap <leader>hb <C-T>

    " Nerdtree
    map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    " FZF
    nnoremap <leader>f :GFiles<cr>
    nnoremap <leader>b :Buffers<cr>

 "}
" Plugin configurations {
    " NerdTree {
        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=0
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    " }
    " Airline{
        let g:airline_theme='gruvbox'
        let g:airline_powerline_fonts = 1

        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif
        " unicode symbols
        "let g:airline_left_sep = '»'
        "let g:airline_left_sep = ''
        "let g:airline_right_sep = '«'
        "let g:airline_right_sep = ''
        "let g:airline_symbols.linenr = '␊'
        "let g:airline_symbols.linenr = '␤'
        "let g:airline_symbols.linenr = '¶'
        "let g:airline_symbols.branch = '⎇ '
        "let g:airline_symbols.paste = 'ρ'
        "let g:airline_symbols.paste = 'Þ'
        "let g:airline_symbols.paste = '∥'
        "let g:airline_symbols.whitespace = 'Ξ'
        let g:airline_exclude_filetypes = ['nerdtree']

    "}
    " Rainbow {
        "let g:rainbow_active = 1
        au! cursormoved * call PoppyInit()
    " }
    " javascript-libraries-syntax {
        let g:used_javascript_libs = 'react'
    " }
    " Emmet {
        let g:user_emmet_install_global = 0
        autocmd FileType html,css,javascript,javascript.jsx EmmetInstall
        let g:user_emmet_settings = {
                    \  'javascript.jsx' : {
                    \      'extends' : 'jsx',
                    \  },
                    \}
    "  }
    " vim-jsx {
        let g:jsx_ext_required = 0
    " }
    "  Ale {
        let g:ale_lint_on_save = 1
        let g:ale_lint_on_text_changed = 'never'
        " disable the Ale HTML linters
        let g:ale_linters = {
        \   'html': [],
        \   'javascript': ['eslint'],
        \   'javascript.jsx': ['eslint'],
        \}
        let g:ale_set_highlights = 0

        "" stop Elm.vim trying to show compiler erorrs in Vim
        "let g:elm_format_fail_silently = 1

        "" set Prettier up to run on save
        "let g:ale_fixers = {}
        "let g:ale_fixers['javascript'] = [
        "\  'prettier-eslint'
        "\]
        "let g:ale_fix_on_save = 1
        "let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'

        let g:ale_sign_error = '●' " Less aggressive than the default '>>'
        let g:ale_sign_warning = '.'
        let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
    "  }
    "  Deoplete {
        let g:deoplete#enable_at_startup = 1
        let g:deoplete#enable_ignore_case = 1
        let g:deoplete#enable_smart_case = 1
        let g:deoplete#enable_camel_case = 1
        let g:deoplete#enable_refresh_always = 1
        let g:deoplete#max_abbr_width = 0
        let g:deoplete#max_menu_width = 0
        let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

        let g:tern_request_timeout = 1
        let g:tern_request_timeout = 6000
        let g:tern#command = ["tern"]
        let g:tern#arguments = ["--persistent"]

        let g:deoplete#omni#functions = {}
        let g:deoplete#omni#functions.javascript = [
          \ 'tern#Complete',
          \ 'jspc#omni'
        \]

        set completeopt=longest,menuone
        let g:deoplete#sources = {}
        let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
        let g:tern#command = ['tern']
        let g:tern#arguments = ['--persistent']

        autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
        let g:UltiSnipsExpandTrigger="<C-j>"
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

        " For conceal markers.
        if has('conceal')
          set conceallevel=2 concealcursor=niv
        endif
    "  }
" }
" Functions {
"
    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        " your .vimrc.local file:
        "   let g:spf13_consolidated_directory = <full path to desired directory>
        "   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
        if exists('g:spf13_consolidated_directory')
            let common_dir = g:spf13_consolidated_directory . prefix
        else
            let common_dir = parent . '/.' . prefix
        endif

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()


    " Strip whitespace {
    function! StripTrailingWhitespace()
        " To disable the stripping of whitespace, add the following to your
        " .vimrc.local file:
        "   let g:spf13_keep_trailing_whitespace = 1
        if !exists('g:spf13_keep_trailing_whitespace')
            " Preparation: save last search, and cursor position.
            let _s=@/
            let l = line(".")
            let c = col(".")
            " do the business:
            %s/\s\+$//e
            " clean up: restore previous search history, and cursor position
            let @/=_s
            call cursor(l, c)
        endif
    endfunction
    " }
" }
"
