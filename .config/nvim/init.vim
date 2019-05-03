let mapleader = " "

" Plugin Block - vim-plug
call plug#begin()
    "Functionality
        Plug 'SirVer/ultisnips'
        Plug 'easymotion/vim-easymotion'
        Plug 'jiangmiao/auto-pairs'
        Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
        Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
        Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
        Plug 'scrooloose/nerdtree'
        Plug 'terryma/vim-multiple-cursors'
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-surround'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-scripts/Tabmerge'
        Plug '~/.fzf'

    "Cosmetic
        Plug 'joshdick/onedark.vim'
        Plug 'morhetz/gruvbox'
        Plug 'dylanaraps/wal.vim'
        " Plug 'nathanaelkane/vim-indent-guides'
        Plug 'rafi/awesome-vim-colorschemes'
        Plug 'ryanoasis/vim-devicons'
        Plug 'Yggdroot/indentLine'
        Plug 'tomasiser/vim-code-dark'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'vwxyutarooo/nerdtree-devicons-syntax'

    "Language support
        Plug 'epilande/vim-es2015-snippets'
        Plug 'epilande/vim-react-snippets'
        Plug 'mustache/vim-mustache-handlebars'
        Plug 'mxw/vim-jsx'
        Plug 'pangloss/vim-javascript'
        Plug 'sheerun/vim-polyglot'
    
    "Disabled
        " coc-emmet works better most of the time
        " Plug 'mattn/emmet-vim'
        " Plug 'Shougo/denite.nvim' sucked!
call plug#end()

" Basic Settings
    " basic of basics
    set nocompatible
    set backspace=indent,eol,start
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set incsearch
    set hlsearch
    set number
    set relativenumber
    set cursorline
    set mouse=a
    filetype plugin indent on
    filetype on
    syntax on
    set wrap
    set splitright
    set splitbelow
    set showcmd

    " vim-devicons needs UTF-8
    set encoding=UTF-8

    " clipboard fix (finally!)
    set clipboard+=unnamedplus

    "terminal colors
    set t_Co=256
    set t_ut=

    "code folding
    set foldmethod=indent
    set foldlevelstart=1
    
    "disable autocommenting
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    
    "disable syntax highlighting in markdown files
    autocmd BufRead,BufNewFile {*.markdown,*.mdown,*.mkdn,*.md,*.mkd,*.mdwn,*.mdtxt,*.mdtext,*.text} set filetype=markdown
    autocmd FileType markdown let g:indentLine_enabled=0

    "use handlebars as html
    au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=html
    
"Leader shortcuts
    nmap <Leader>w :w<CR>   
    nmap <Leader>q :q<CR>   

"Ctrl+hjkl navigation for insert and command mode
    inoremap <C-h> <Left>
    inoremap <C-j> <Down>
    inoremap <C-k> <Up>
    inoremap <C-l> <Right>
    cnoremap <C-h> <Left>
    cnoremap <C-j> <Down>
    cnoremap <C-k> <Up>
    cnoremap <C-l> <Right>

"Tab/Split bindings"
    "navigation rebindings
    nnoremap tr :tabnew<Space>
    nnoremap tk :tabnext<CR>
    nnoremap tj :tabprev<CR>
    nnoremap th :tabfirst<CR>
    nnoremap tl :tablast<CR>
    nnoremap td :tabc<CR>

    "shift tabs left and right
    nnoremap t= :tabm +1<CR>
    nnoremap t- :tabm -1<CR>

    "tT moves the split to new tab
    nnoremap tT <C-W>T

    "ts shuffles the top left/right top/bottom
    nnoremap ts <C-W>R

    "split maximize and split normalize
    nnoremap tb <C-W>\|
    nnoremap tn <C-W>=
    nnoremap tm <C-W>_

    "Merging splits back to tabs
    nnoremap tu :Tabmerge left<CR>
    nnoremap ti :Tabmerge right<CR>

    "splits navigation rebindings
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

"Plugin Specific Settings
    " coc.nvim settings
        "vscode like tab completion
        inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
        let g:coc_snippet_next = '<TAB>'
        let g:coc_snippet_prev = '<S-TAB>'

        augroup mygroup
          autocmd!
          " Setup formatexpr specified filetype(s).
          autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
          " Update signature help on jump placeholder
          autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        augroup end

        " Use K to show documentation in preview window
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
            if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
            else
                call CocAction('doHover')
            endif
        endfunction

    " vim-prettier config
        " Force Async
        let g:prettier#exec_cmd_async = 1

        " max line length that prettier will wrap on
        " Prettier default: 80
        let g:prettier#config#print_width = 100

        " number of spaces per indentation level
        " Prettier default: 2
        let g:prettier#config#tab_width = 4

        " single quotes over double quotes
        " Prettier default: false
        let g:prettier#config#single_quote = 'true'

    "vim-airline config
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
        let g:airline_powerline_fonts = 1

        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif

        " unicode symbols
        let g:airline_left_sep = '»'
        let g:airline_left_sep = '▶'
        let g:airline_right_sep = '«'
        let g:airline_right_sep = '◀'
        let g:airline_symbols.linenr = '␊'
        let g:airline_symbols.linenr = '␤'
        let g:airline_symbols.linenr = '¶'
        let g:airline_symbols.branch = '⎇'
        let g:airline_symbols.paste = 'ρ'
        let g:airline_symbols.paste = 'Þ'
        let g:airline_symbols.paste = '∥'
        let g:airline_symbols.whitespace = 'Ξ'

        " airline symbols
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.branch = ''
        let g:airline_symbols.readonly = ''
        let g:airline_symbols.linenr = ''
       
        "tab-bar seperator
        " let g:airline#extensions#tabline#left_sep = ' '
        " let g:airline#extensions#tabline#left_alt_sep = '|'
        let g:airline#extensions#tabline#show_buffers = 0

    "mustache-handlebars config
        let g:mustache_abbreviations = 1
    
    "NerdTree
        nmap <Leader>n :NERDTreeToggle<CR>
        let g:NERDTreeDirArrowExpandable="+"
        let g:NERDTreeDirArrowCollapsible="~"
    
    "FZF
        nmap <Leader>f :FZF<CR>
        let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
              \ 'bg':      ['bg', 'Normal'],
              \ 'hl':      ['fg', 'Comment'],
              \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
              \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
              \ 'hl+':     ['fg', 'Statement'],
              \ 'info':    ['fg', 'PreProc'],
              \ 'border':  ['fg', 'Ignore'],
              \ 'prompt':  ['fg', 'Conditional'],
              \ 'pointer': ['fg', 'Exception'],
              \ 'marker':  ['fg', 'Keyword'],
              \ 'spinner': ['fg', 'Label'],
              \ 'header':  ['fg', 'Comment'] }
        autocmd! FileType fzf
        autocmd  FileType fzf set laststatus=0 noshowmode noruler
          \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
    
    "indentlines
        let g:indentLine_enabled = 1
        let g:indentLine_char = '|'

    "vim-devicons settings
        let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
    
    "vim-indent-guides settings
        let g:indent_guides_guide_size=1
        let g:indent_guides_enable_on_vim_startup = 1
        let g:indent_guides_auto_colors = 0
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=235
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=235

    "ultisnips settings
        let g:UltiSnipsExpandTrigger="<C-l>"

    "vim-javascript settings
        " http://usejsdoc.org/
        "
        let g:javascript_plugin_jsdoc = 1
        "
        "folding based on this plugin syntax definitions
            augroup javascript_folding
                au!
                au FileType javascript setlocal foldmethod=syntax
            augroup END

"Theming
    let g:airline_theme='distinguished'
    set background=dark
    colo codedark
    " highlight Normal ctermbg=Black
    " highlight NonText ctermbg=Black
