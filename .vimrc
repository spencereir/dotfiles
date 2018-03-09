syntax on
filetype plugin indent on

" Search
set incsearch
set hlsearch

" Spaces and not tabs :(
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" format JSON files properly
au! BufRead,BufNewFile *.json set filetype=json

" Strip trailing spaces on Python, JS, CSS, HTML, and TPL files
autocmd BufWritePre *.py,*.js,*.css,*.html,*.tpl :%s/\s\+$//e

" ignore .pyc, .o, and .git in command-t and :e
set wildignore+=*.pyc,*.o,.git

" Higlight any trailing whitespace
highlight ExtraWhiteSpace ctermbg=red guibg=red
let w:ews=matchadd('ExtraWhiteSpace', '\s\+$', 11)

" Remaps
nnoremap <silent> <leader>c <Esc>:nohlsearch<CR><Esc>

" When editing a file that requires root, try to save using sudo
cmap w!! %!sudo tee > /dev/null %
