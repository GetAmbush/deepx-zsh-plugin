# Takes a screenshot of connected Android device using adb
function heckshot() {
    FILENAME=$1
    FILENAME="${FILENAME:-screenshot}"
    adb shell screencap -p /sdcard/$FILENAME.png
    adb pull /sdcard/$FILENAME.png $2
    adb shell rm /sdcard/$FILENAME.png
}

# Connects to a screen in the local network using Screen Sharing
function pair () {open vnc://$1}
