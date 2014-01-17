#!/bin/bash

cd $1
find . -type f -regex ".*\.cpp" -or -regex ".*\.c" -or -regex ".*\.hpp" -or -regex ".*\.inl" -or -regex ".*\.h" -or -regex ".*\.cxx"|grep -v _bak > cscope.files
cscope -bq
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=*_bak --exclude=*python* -f tags -L cscope.files
rm -rf cscope.files
