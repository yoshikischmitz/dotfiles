" Basic setup:
execute pathogen#infect()

set nocompatible
syntax on
filetype plugin indent on

" Color scheme and interface stuff:
set number

colorscheme monokai
set background=dark

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=4

" YARD highlights:
hi link yardType rubyString
hi link yardParam rubySymbol
hi link yardReturn rubySymbol
hi link yardLiteral rubyString

" Language specific tabs:
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype lisp setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
au BufRead,BufNewFile *.rtex  setlocal ts=2 sts=2 sw=2 expandtab filetype=eruby.latex
autocmd FileType haskell setlocal ts=2 sts=2 sw=2 expandtab

let g:haskell_conceal_wide = 1
let g:haskell_conceal=0


" Keybindings:
set rtp+=~/.fzf " FZF fuzzy finder
nnoremap <C-p> :FZF <CR>

map <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
imap <S-CR> <CR><CR>end<Esc>-cc

" drag lines with ctrl+j and ctrl+l
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:ackprg = 'ag --nogroup --nocolor --column'
