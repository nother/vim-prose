" VimProse, a plugin for writing prose
" File: vimprose.vim
" Description: A plugin to make writing prose (long lines
"              of unwrapped text) easier.
" Author: nother <https://github.com/nother>
" Version: 0.1
" Last Change: 2012-08-09
" License: Vim License

if exists("g:loaded_VimProse") || &cp
    finish
endif

let g:loaded_VimProse = 1
let s:keepcpo = &cpo
set cpo&vim

if !hasmapto("<Plug>VimProseEnable")
   map <unique> <Leader>p <Plug>VimProseEnable
endif

nnoremap <silent> <unique> <script> <Plug>VimProseEnable <SID>Enable
nnoremap <SID>Enable :set lz<CR>:call <SID>Enable()<CR>:set nolz<CR>

noremenu <script> Plugin.VimProse <SID>Enable

function s:Enable()
    " turn on word wrap
    setlocal wrap
    " wrap lines at characters defined in the breakat option
    setlocal linebreak
    " nolist needed for linebreak
    setlocal nolist
    " disable auto-wrapping
    setlocal textwidth=0
    " if textwidth & auto-wrapping is desired,
    " add the l option to formatoptions:
    "   Long lines are not broken in insert mode: When a line was
    "   longer than 'textwidth' when the insert command started,
    "   Vim does not automatically format it.
    setlocal formatoptions+=l
    " show the last line even if it is long
    setlocal display=lastline
    " spell check
    setlocal spell
    " navigate within wrapped lines using the standard j & k keys
    nnoremap <buffer> j gj
    nnoremap <buffer> k gk
    vnoremap <buffer> j gj
    vnoremap <buffer> k gk
    " set an undo point at the ends of sentences since it's common
    " to write a fair amount before leaving insert mode.
    inoremap <buffer> . .<C-g>u
    inoremap <buffer> ! !<C-g>u
    inoremap <buffer> ? ?<C-g>u
    inoremap <buffer> : :<C-g>u
endfunction

if !exists(":VimProseEnable")
    command -nargs=0 VimProseEnable :call s:Enable()
endif

let &cpo = s:keepcpo
unlet s:keepcpo
