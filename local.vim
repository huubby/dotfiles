set tags+=tags,~/share/tags

""""""""""""""""""""""""""""""""""""""
" Voyager project settings
""""""""""""""""""""""""""""""""""""""
" Set includes to path
let s:includes=split(system('find . -type f -name "*.h" -printf "%h\n"|sort|uniq'), '\n')

function! IncludePathes()
    let curdir = getcwd()
    for include in s:includes
        let curinclude=curdir . '/' . include
        exec 'set path+=' . curinclude
    endfor
endfunction

call IncludePathes()

" error format
set efm-=%f(%l):%m
set efm-=%f:%l:%m
set efm+=%f:%l:\ %m
set efm+=%DEntering\ directory:\ '%f',%XLeaving\ directory:\ '%f'

set makeprg=./exec_make
autocmd FileType c,cpp map<buffer> <leader><space> :w<cr>:make collector<cr>

map <F6> :!./refresh_tags<cr>:cs reset<cr>
