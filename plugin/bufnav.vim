if exists('g:loaded_bufnav') | finish | endif
let s:save_cpo = &cpo
set cpo&vim

command! BufNavNext lua require("bufnav.commands").next_buffer()
command! BufNavPrev lua require("bufnav.commands").prev_buffer()
command! BufNavDebug lua require("bufnav.debug").toggle()

let &cpo = s:save_cpo
unlet s:save_cpo
let g:loaded_bufnav = 1
