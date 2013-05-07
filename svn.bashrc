case "$TERM" in
msys)
CONTEXT_COLOR="^[[37m"
ADD_COLOR="^[[32m"
DELETE_COLOR="^[[31m"
LOCATION_COLOR="^[[36m"
INDEX_COLOR="^[[35m"
NORM_COLOR="^[[0m"
;;
*) CONTEXT_COLOR=`tput setaf 7`
ADD_COLOR=`tput setaf 2`
DELETE_COLOR=`tput setaf 1`
LOCATION_COLOR=`tput setaf 6`
FILE_COLOR=`tput setaf 3`
INDEX_COLOR=`tput setaf 5`
NORM_COLOR=`tput sgr0`
;;
esac

# 该函数用于svn log的颜色显示
slg() {
    env svn log $* |
    sed -e "/r[0-9]\+ /,/^------\+/{
    /r[0-9]\+ /s:.*:$ADD_COLOR&$NORM_COLOR:
    /r[0-9]\+ /!{
    /^------\+/!s:.*:$FILE_COLOR&$NORM_COLOR:
}
}" -e "/^------\+/s:.*:$DELETE_COLOR&$NORM_COLOR:" |
${PAGER:-less -QRS}
}

# 该函数用于svn diff的颜色显示
sdl() {
env svn diff $* |
sed -e "s/^+[^+].*/${ADD_COLOR}&${NORM_COLOR}/g" \
-e "s/^-[^-].*/${DELETE_COLOR}&${NORM_COLOR}/g" \
-e "s/^[-+]\{3\}.*/${FILE_COLOR}&${FILE_COLOR}/g" \
-e "s/^@@.*/${LOCATION_COLOR}&${NORM_COLOR}/g" \
-e "s/^[iI]ndex.*/${INDEX_COLOR}&${NORM_COLOR}/g" \
-e "s/.*/${CONTEXT_COLOR}&${NORM_COLOR}/g" \
-e "s/\r//g" |
${PAGER:-less -QRS}
}

# 该函数用于显示当前svn被修改的文件
sdlf() {
env svn diff $* |
grep "^--- " |
sed -e "s/^[-+]\{3\}.*/${FILE_COLOR}&${FILE_COLOR}/g"
}

# 这里，用于自定义svn的子命令
svn() {
case "$1" in
log)
shift
slg "$@"
;;
diff)
shift
sdl "$@"
;;
*)
env svn "$@"
;;
esac
}
