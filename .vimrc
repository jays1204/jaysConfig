syn on
set ai
set bg=dark
colo desert
set nu
set sw=2
set sts=2
set ls=2
set expandtab
set fencs=utf-8,cp949,ucs-bom
set nocompatible

au BufNewFile,BufRead *.html,*.htm,*.coffee,*.ejs,*.rb,*.js setlocal sw=2

filetype on
filetype plugin indent on

com! -nargs=0 A execute '!jslint --indent 2 --nomen %'
com! -nargs=0 B execute 'silent !tmux send-keys C-c "   make test" C-m' | execute 'redraw!'

highlight Folded guibg=darkgrey guifg=blue
highlight FoldColumn guibg=darkgrey guifg=white

