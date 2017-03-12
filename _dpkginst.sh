__cecho() {
    local color="$1"
    shift
    echo -e "\e[${color}m$*\e[m"
}

debinstall() {
    local APPNAME="$1"
    local APPURL="$2"
    TMPFILE=$(tempfile -s .deb)
    trap "rm -f $TMPFILE" EXIT
    __cecho "32" "Downloading ${APPNAME} package..."
    curl --progress-bar -L -k -o $TMPFILE "$APPURL"
    __cecho "32" "Installing ${APPNAME}..."
    sudo dpkg -i $TMPFILE
    __cecho "32" "done."
}
