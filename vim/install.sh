#!/bin/bash

PREFIX="https"
GITHUB="github.com"
PLUGINS=("vim-scripts/bufexplorer.zip"
         "vim-scripts/closetag.vim"
         "kien/ctrlp.vim"
         "vim-scripts/matchit.zip"
         "mschinz/omnicppcomplete"
         "kevinw/pyflakes-vim"
         "msanders/snipmate.vim"
         "ervandew/supertab"
         "vim-scripts/Tagbar"
         "altercation/vim-colors-solarized"
         "chriskempson/vim-tomorrow-theme"
         "Lokaltog/vim-easymotion"
         "sukima/xmledit"
         "mattn/zencoding-vim")
SUFFIX=".git"

echo "Start to install plugins..."
cd bundle/
for plugin in ${PLUGINS[@]}; do
    git clone $PREFIX://$GITHUB/$plugin$SUFFIX
done

echo "Done."
