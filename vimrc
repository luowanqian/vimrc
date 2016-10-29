" Environment {
    
    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return has('win32') || has('win64')
        endfunction
    " }

    " Basics {
        set nocompatible
    " }

" }

" Use before config if available {
    if filereadable(expand("~/.vimrc.before"))
        source ~/.vimrc.before
    endif
" }

" Use bundles config {

    if filereadable(expand("~/.vim/vimrc.bundles"))
        source ~/.vim/vimrc.bundles
    endif

" }

" General {

    set background=dark         " Assume a dark background
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    scriptencoding utf-8

    set history=1000            " Store a ton of history (default is 20)

    " Most prefer to automatically switch to the current file directory when
    " a new buffer is opened; to prevent this behavior, add the following to
    " your .vimrc.before.local file:
    "   let g:myvim_no_autochdir = 1
    if !exists('g:myvim_no_autochdir')
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        " Always switch to the current file directory
    endif

" }

" Vim UI {

    try
        colorschem  molokai
    catch
    endtry

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                        " Filename
        set statusline+=%w%h%m%r                    " Options
        set statusline+=\ [%{&ff}/%Y]               " Filetype
        set statusline+=\ [%{getcwd()}]             " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%     " Right aligned file nav info
    endif

    set foldenable              " Auto fold code
    set cursorline              " Highlight current line
    set number                  " Line numbers on
    set hlsearch                " Highlight search terms
    set ignorecase              " Case insensitive search

" }

" Formatting {

    set nowrap                  " Do not wrap long lines
    set autoindent              " Indent at the same level of the previous line 
    set shiftwidth=4            " Use indents of 4 spaces
    set tabstop=4               " An indentation every four columns

    " Folding options for vim
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmarker={,} foldlevel=0 foldmethod=marker
    augroup END

" }

" Key (re)Mappings {

    let mapleader = ','

    " Remap VIM 0 to first non-blank character
    noremap 0 ^

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    "Smart way to move between windows
    nnoremap <C-j> <C-w><C-j>
    nnoremap <C-k> <C-w><C-k>
    nnoremap <C-l> <C-w><C-l>
    nnoremap <C-h> <C-w><C-h>
    
    " Useful mappings for managing tabs
    nnoremap <leader>tn :tabnew<cr>
    nnoremap <leader>to :tabonly<cr>
    nnoremap <leader>tc :tabclose<cr>
    nnoremap <leader>tm :tabmove 

    " Map <ESC> in insert mode  
    inoremap jk <esc>

" }

" GUI Settings {

    if has('gui_running')
        set lines=40        " 40 lines of text instead of 24
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256    " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
    endif
" }

" Use local vimrc is available {

    if filereadable(expand("~/.vim/vimrc.local"))
        source ~/.vim/vimrc.local
    endif

" }
