#!/bin/bash

cd $1
find . -type f -regex ".*\.cpp" -or -regex ".*\.c" -or -regex ".*\.hpp" -or -regex ".*\.inl"|grep -v _bak|grep -v python > cscope.files
cscope -bq
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f tags --exclude=*_bak --exclude=*python*
rm -rf cscope.files
