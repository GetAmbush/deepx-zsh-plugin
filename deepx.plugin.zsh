
function heckshot() {
    FILENAME=$1
    FILENAME="${FILENAME:-screenshot}"
    adb shell screencap -p /sdcard/$FILENAME.png
    adb pull /sdcard/$FILENAME.png $2
    adb shell rm /sdcard/$FILENAME.png
}
