#! /bin/sh

ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f tags --exclude=*_bak --exclude=*python*
