#! /bin/sh
find . -type f -regex ".*\.cpp" -or -regex ".*\.c" -or -regex ".*\.hpp" -or -regex ".*\.inl"|grep -v _bak|grep -v python > cscope.files
cscope -bq
