# 复制文件夹到粘贴板
file-to-clipboard() {
    osascript \
        -e 'on run args' \
        -e 'set the clipboard to POSIX file (first item of args)' \
        -e end \
        "$@"
}

# 复制图片到粘贴板
clip_img() {
    osascript -e 'on run argv' \
        -e 'set currentDir to do shell script "pwd"' \
        -e 'set the clipboard to (read POSIX file (POSIX path of (currentDir as text & (first item of argv) )) as JPEG picture)' \
        -e 'end run' "/$1"
    # osascript -e 'clipboard info'
}