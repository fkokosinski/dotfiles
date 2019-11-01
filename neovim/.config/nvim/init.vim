" Vundle initialization
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/vader.vim'

" syntax plugins
Plugin 'mboughaba/i3config.vim'

call vundle#end()

filetype plugin indent on

" numbering
set number
set numberwidth=4
set relativenumber

" indenting
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent

" incremental searching
set incsearch

" move hjkl by one position to the right
noremap ; l
noremap l k
noremap k j
noremap j h

" force usage of the home row for common commands
inoremap    <esc>   <nop>
inoremap    jk      <esc>
vnoremap    jk      <esc>
noremap     <left>  <nop>
noremap     <right> <nop>
noremap     <up>    <nop>
noremap     <down>  <nop>

" leader settings
let mapleader       = ","
let localmapleader  = ","

" vimrc editing/sourcing
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" common abbreviations
iabbrev abbr        abbreviation
iabbrev misc        miscellaneous
iabbrev heigth      height
iabbrev beggining   beginning

" comments
augroup comments
    autocmd!
    autocmd FileType vim    vnoremap <buffer> <leader>c I"<esc>
    autocmd FileType c      vnoremap <buffer> <leader>c I//<esc>
    autocmd FileType python vnoremap <buffer> <leader>c I#<esc>
augroup END

" show trailing whitespace
nnoremap <leader>w :match Error /\s$/<cr>
nnoremap <leader>W :match<cr>

" very magic
nnoremap / /\v
nnoremap ? ?\v

" operator pending tests
onoremap in"    :<C-u>normal! f"vi"<cr>
onoremap il"    :<C-u>normal! F"vi"<cr>
onoremap is     :<C-u>execute "normal! ?^[=-]\\+$\r:nohl\rkvg_"<cr>
onoremap in@    :<C-u>execute "normal! /\\S\\+@\\S\\+\r:nohl\rvf h"<cr>

" custom grep operator
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<C-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let l:reg = @@

    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    silent execute "grep! -InHR " . shellescape(@@) . " ."
    copen

    let @@ = l:reg
endfunction
