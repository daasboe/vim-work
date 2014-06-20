" Header {
" vim: set sw=4 sts=4 foldmarker={,} foldlevel=0 foldmethod=marker:
" }
" Environment {
" Basics {
set nocompatible        " must be first line
set encoding=utf-8
set background=dark     " Assume a dark background
let $LANG = "en_US.UTF-8"
" }
" Setup Bundle Support {
" The next two lines ensure that the ~/.vim/bundle/ system works
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" }
" }
" Bundles {
    " Make sure to use http instead of https or git behind proxy
    let g:vundle_default_git_proto = 'https'
    let $GIT_SSL_NO_VERIFY = 'true'
    Bundle 'gmarik/vundle'
    Bundle 'MarcWeber/vim-addon-mw-utils'
    Bundle 'tomtom/tlib_vim'
    "Bundle 'myusuf3/numbers.vim'
    "Bundle 'Lokaltog/vim-powerline'
    "Bundle 'itchyny/lightline.vim'
    Bundle 'bling/vim-airline'
    "Bundle 'bling/vim-bufferline'
    Bundle 'scrooloose/nerdcommenter'
    " Snippets & AutoComplete
        Bundle 'Shougo/neocomplcache.vim'
        Bundle 'Shougo/neosnippet.vim'
        Bundle 'Shougo/neosnippet-snippets'
        "Bundle 'garbas/vim-snipmate'
        "Bundle 'honza/vim-snippets'
        "Bundle 'ervandew/supertab'
        "" Source support_function.vim to support snipmate-snippets.
        "if filereadable(expand("~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim"))
            "source ~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim
        "endif
    if executable('ctags')
        Bundle 'majutsushi/tagbar'
    endif
    Bundle 'scrooloose/nerdtree'
    Bundle 'spf13/vim-colors'
    Bundle 'morhetz/gruvbox'
    Bundle 'tpope/vim-surround'
    Bundle 'kien/ctrlp.vim'
    Bundle 'vim-scripts/sessionman.vim'
    Bundle 'matchit.zip'
    "Bundle 'Lokaltog/vim-easymotion'
    Bundle 'godlygeek/csapprox'
    Bundle 'jistr/vim-nerdtree-tabs'
    Bundle 'flazz/vim-colorschemes'
    Bundle 'mbbill/undotree'
    Bundle 'tpope/vim-fugitive'
    Bundle 'godlygeek/tabular'
    Bundle 'daasboe/vim-extra-colors'
    Bundle 'chmllr/vim-colorscheme-elrodeo'
    Bundle 'chrisbra/NrrwRgn'
    Bundle 'Raimondi/delimitMate'
    Bundle 'kana/vim-fakeclip'
    Bundle 'amdt/vim-niji'
    Bundle 'nathanaelkane/vim-indent-guides'
    " Clojure stuff
    Bundle 'guns/vim-clojure-static'
    Bundle 'guns/vim-clojure-highlight'
    Bundle 'tpope/vim-fireplace'
    Bundle 'tpope/vim-classpath'
    "Bundle 'kovisoft/slimv'
    Bundle 'vim-scripts/paredit.vim'
    "Bundle 'dgrnbrg/vim-redl'
    " node.js stuff
    "Bundle 'digitaltoad/vim-jade'
    "Bundle 'myhere/vim-nodejs-complete'

    " Javascript checker
    Bundle 'walm/jshint.vim'

    " Python stuff
    Bundle 'tmhedberg/SimpylFold'

    " Syntax check
    Bundle 'scrooloose/syntastic'
    " Electronics {
      Bundle 'vim-scripts/spectre.vim'
      Bundle 'vim-scripts/ocean.vim'
    " }
    "
    " Profitbase{
    Bundle 'vim-scripts/mdx.vim'
    "}
" }
" General {

    set background=dark                  " Assume a dark background
    colorscheme gruvbox                 " Set colorscheme
    if !has('gui')
        set background=dark         " Assume a dark background
    endif
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has ('x') && has ('gui') " On Linux use + register for copy-paste
        set clipboard=unnamedplus
    elseif has ('gui')          " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif

    " Always switch to the current file directory
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

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

        " To disable views add the following to your .vimrc.bundles.local file:
        "   let g:spf13_no_views = 1
        if !exists('g:spf13_no_views')
            " Add exclusions to mkview and loadview
            " eg: *.*, svn-commit.tmp
            let g:skipview_files = [
                \ '\[example pattern\]'
                \ ]
        endif
    " }
" }
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
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set foldmethod=syntax           " Set foldmethod to syntax
    " Use the same symbols as TextMate for tabstops and EOLs
    set listchars=tab:▸\ ,eol:¬,trail:.,extends:#,nbsp:.

" }
" Formatting {

    set nowrap                      " Wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=2                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=2                   " An indentation every four columns
    set softtabstop=2               " Let backspace delete indent
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml,ocn autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

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

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

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
        nnoremap <C-S-tab> :tabprevious<CR>
        nnoremap <C-tab>   :tabnext<CR>
        nnoremap <C-t>     :tabnew<CR>
        inoremap <C-S-tab> <Esc>:tabprevious<CR>i
        inoremap <C-tab>   <Esc>:tabnext<CR>i
        inoremap <C-t>     <Esc>:tabnew<CR>

        nnoremap th  :tabfirst<CR>
        nnoremap tj  :tabnext<CR>
        nnoremap tk  :tabprev<CR>
        nnoremap tl  :tablast<CR>
        nnoremap tt  :tabedit<Space>
        nnoremap tn  :tabnext<Space>
        nnoremap tm  :tabm<Space>
        nnoremap td  :tabclose<CR>
        nnoremap <silent> <C-b> :CtrlPMRU<CR>
        "
    " }

    " Shortcut to rapidly toggle `set list`
    nmap <leader>l :set list!<CR>

    " Quick vimrc editing
    nnoremap <leader>em :vsplit $MYVIMRC<cr>
    nnoremap <leader>sm :so $MYVIMRC<cr>

    " Easier help navigation on norwegian keyboard layout
    nnoremap <leader>hg <C-]>
    nnoremap <leader>hb <C-T>
" }
" Plugins {
    "" OmniComplete {
        "if has("autocmd") && exists("+omnifunc")
            "autocmd Filetype *
                "\if &omnifunc == "" |
                "\setlocal omnifunc=syntaxcomplete#Complete |
                "\endif
        "endif

        "hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        "hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        "hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

        "" Some convenient mappings
        "inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        "inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
        "inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        "inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        "inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        "inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

        "" Automatically open and close the popup menu / preview window
        "au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        "set completeopt=menu,preview,longest
    "" }
    " Neocomplcache {
        "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        " Use neocomplcache.
        let g:neocomplcache_enable_at_startup = 1
        " Use smartcase.
        let g:neocomplcache_enable_smart_case = 1
        " Set minimum syntax keyword length.
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

        " Enable heavy features.
        " Use camel case completion.
        "let g:neocomplcache_enable_camel_case_completion = 1
        " Use underbar completion.
        "let g:neocomplcache_enable_underbar_completion = 1

        " Define dictionary.
        let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
            let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings.
        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-l>     neocomplcache#complete_common_string()

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
          return neocomplcache#smart_close_popup() . "\<CR>"
          " For no inserting <CR> key.
          "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        endfunction
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()
        " Close popup by <Space>.
        "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

        " For cursor moving in insert mode(Not recommended)
        "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
        "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
        "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
        "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
        " Or set this.
        "let g:neocomplcache_enable_cursor_hold_i = 1
        " Or set this.
        "let g:neocomplcache_enable_insert_char_pre = 1

        " AutoComplPop like behavior.
        "let g:neocomplcache_enable_auto_select = 1

        " Shell like behavior(not recommended).
        "set completeopt+=longest
        "let g:neocomplcache_enable_auto_select = 1
        "let g:neocomplcache_disable_auto_complete = 1
        "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
          let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

        " For perlomni.vim setting.
        " https://github.com/c9s/perlomni.vim
        let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    "}
    " Neosnippet{
        " Plugin key-mappings.
        imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        smap <C-k>     <Plug>(neosnippet_expand_or_jump)
        xmap <C-k>     <Plug>(neosnippet_expand_target)

        " SuperTab like snippets behavior.
        "imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        "\ "\<Plug>(neosnippet_expand_or_jump)"
        "\: pumvisible() ? "\<C-n>" : "\<TAB>"
        "smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        "\ "\<Plug>(neosnippet_expand_or_jump)"
        "\: "\<TAB>"

        " For snippet_complete marker.
        if has('conceal')
          set conceallevel=2 concealcursor=i
        endif
    "}
    " Misc {
        let g:NERDShutUp=1
        let b:match_ignorecase = 1
    " }

    " Ctags {
        set tags=./tags;/,~/.vimtags
    " }

    " NerdTree {
        map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=0
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    " }

    " Tabularize {
        nmap <leader>a& :Tabularize /&<CR>
        vmap <leader>a& :Tabularize /&<CR>
        nmap <leader>a= :Tabularize /=<CR>
        vmap <leader>a= :Tabularize /=<CR>
        nmap <leader>a: :Tabularize /:<CR>
        vmap <leader>a: :Tabularize /:<CR>
        nmap <leader>a:: :Tabularize /:\zs<CR>
        vmap <leader>a:: :Tabularize /:\zs<CR>
        nmap <leader>a, :Tabularize /,<CR>
        vmap <leader>a, :Tabularize /,<CR>
        nmap <leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <leader>a<Bar> :Tabularize /<Bar><CR>
        nmap <leader>a1= :Tabularize /^[^=]*\zs<CR>
        vmap <leader>a1= :Tabularize /^[^=]*\zs<CR>
        nmap <leader>as:Tabularize /\s<CR>
        vmap <leader>as :Tabularize /\s<CR>
        nmap <leader>a+ :Tabularize /<+<CR>
        vmap <leader>a+ :Tabularize /<+<CR>
    " }

    " Session List {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
    " }

    " UndoTree {
        nnoremap <Leader>u :UndotreeToggle<CR>
        " If undotree is opened, it is likely one wants to interact with it.
        let g:undotree_SetFocusWhenToggle=1
    " }

    " Supertab {
        let g:SuperTabDefaultCompletionType = "context"
        let g:SuperTabContextDefaultCompletionType = "<c-n>"
    " }

    " Indent guides {
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
    " }
    " Paredit{
        nnoremap <leader><leader>e :%Eval<CR>
    " }

    " Clojure static {
        let g:clojure_align_multiline_strings = 1
    " }
    " Lightline{
            let g:lightline = {
                        \ 'colorscheme': 'wombat',
                        \ }
    "}
    " Slimv {
        "let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp\""'
        "let g:slimv_swank_clojure = '!osascript -e lein swank &'
    " }
    "{
    "}
    " Airline{
        "let g:airline_powerline_fonts=1
        let g:airline_theme='wombat'
        if !exists('g:airline_symbols')
        let g:airline_symbols = {}
        endif

        " unicode symbols
        let g:airline_left_sep = '»'
        let g:airline_left_sep = ''
        let g:airline_right_sep = '«'
        let g:airline_right_sep = ''
        let g:airline_symbols.linenr = '␊'
        let g:airline_symbols.linenr = '␤'
        let g:airline_symbols.linenr = '¶'
        let g:airline_symbols.branch = '⎇ '
        let g:airline_symbols.paste = 'ρ'
        let g:airline_symbols.paste = 'Þ'
        let g:airline_symbols.paste = '∥'
        let g:airline_symbols.whitespace = 'Ξ'
    "}
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
            "set guifont=-misc-fixed-medium-r-semicondensed-*-*-120-*-*-*-*-iso10646-*
            set guifont=Inconsolata:h14
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif
"}
" Filetypes {
    autocmd BufNewFile,BufRead *.ocn set filetype=ocean
    autocmd BufNewFile,BufRead *.sp,*.cir,*.ana set filetype=spice
    autocmd BufNewFile,BufRead *.vec set filetype=vector
    autocmd BufNewFile,BufRead *.scs set filetype=spectre
    autocmd BufNewFile,BufRead *.va set filetype=verilogams
    autocmd BufNewFile,BufRead *.clj,*.cljs set filetype=clojure
    autocmd FileType make setlocal ts=4 sts=4 sw=4 noet
    autocmd FileType spice call SpiceSettings()
    autocmd FileType snippet,snippets setlocal ts=2 sts=2 sw=2 noet

    " Filetype functions "{
    function SpiceSettings()
        set ts=2 sts=2 sw=2 noet
        set foldmethod=marker
        set foldmarker={,}
        set commentstring=*%s
    endfunction
    "}

" }
" Functions {

    " UnBundle {
    function! UnBundle(arg, ...)
      let bundle = vundle#config#init_bundle(a:arg, a:000)
      call filter(g:bundles, 'v:val["name_spec"] != "' . a:arg . '"')
    endfunction

    com! -nargs=+         UnBundle
    \ call UnBundle(<args>)
    " }

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
    " }

    " Initialize NERDTree as needed {
    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
    " }

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

    call InitializeDirectories()

" }
