""""""""""""""""""""""""""""""""""""""
" project settings
""""""""""""""""""""""""""""""""""""""
set tags+=tags

function! RefreshTags()
    if has('Win32')
        cs kill 0
        let cmd = "updatetags.bat"
    else
        let cmd = "./updatetags.sh " . getcwd()
    endif

    echo cmd
    echo system(cmd)
    if v:shell_error
        echohl ErrorMsg | echom 'Failed to run ' . cmd | echohl NONE
    endif

    if filereadable("cscope.out")
        cs add cscope.out
    endif
endfunction

map <F6> :wa<cr>:call RefreshTags()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Include path settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set includes to path
if has('Win32')
    let s:includes=[
                \"DIRECTORY_1/", 
                \"DIRECTORY_2/**"]
else
    let s:includes=split(system('find . -type f -name "*.h" -printf "%h\n"|sort|uniq'), '\n')
endif

function! IncludePaths()
    let curdir = getcwd()
    for include in s:includes
        let curinclude=curdir . '/' . include
        exec 'set path+=' . curinclude
    endfor
endfunction

call IncludePaths()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" CtrlP settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = getcwd() .'/.cache/ctrlp'

