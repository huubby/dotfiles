#!/bin/bash

PREFIX="https"
GITHUB="github.com"
PLUGINS=("vim-scripts/bufexplorer.zip"
         "vim-scripts/closetag.vim"
         "kien/ctrlp.vim"
         "vim-scripts/matchit.zip"
         "mschinz/omnicppcomplete"
         "kevinw/pyflakes-vim"
         "garbas/vim-snipmate"
         "tomtom/tlib_vim"
         "MarcWeber/vim-addon-mw-utils"
         "ervandew/supertab"
         "vim-scripts/Tagbar"
         "altercation/vim-colors-solarized"
         "chriskempson/vim-tomorrow-theme"
         "Lokaltog/vim-easymotion"
         "sukima/xmledit"
         "tpope/vim-fugitive"
         "dgryski/vim-godef"
         "Blackrush/vim-gocode"
         "mattn/zencoding-vim")
SUFFIX=".git"

echo "Start to update plugins..."
CWD=`pwd`
for plugin in ${PLUGINS[@]}; do
    cd bundle/`basename $plugin`
    echo "Updating $plugin"
    git pull
    cd $CWD
done

echo "Done."

