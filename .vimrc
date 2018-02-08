execute pathogen#infect()
syntax on

filetype plugin indent on

" Airline setup
let g:airline_powerline_fonts = 1

" Solarized setup
let g:solarized_termcolors=256
color solarized
set background=dark

" Search
set incsearch
set hlsearch

" Line numbering
set number relativenumber

" Spaces and not tabs :(
set tabstop=4
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

" Higlight any lines that are too long
highlight OverLines ctermbg=red guibg=red
let w:ol=matchadd('OverLines', '\%>80v.')

" Colour the edge of the terminal lighter
let &colorcolumn=join(range(82,9999),",")

" Remaps
nnoremap <silent> <leader>c <Esc>:nohlsearch<CR><Esc>

if has("autocmd")
     au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
 endif

" When editing a file that requires root, try to save using sudo
cmap w!! %!sudo tee > /dev/null %

" Use the FairyFloss Airline theme
let g:airline_theme='fairyfloss'

" Don't popup docstrings for Jedi-Vim
autocmd FileType python setlocal completeopt-=preview
