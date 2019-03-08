# Takes a screenshot of connected Android device using adb
function heckshot() {
    FILENAME=$1
    FILENAME="${FILENAME:-screenshot}"
    adb shell screencap -p /sdcard/$FILENAME.png
    adb pull /sdcard/$FILENAME.png $2
    adb shell rm /sdcard/$FILENAME.png
}

# Sends broadcast to app - First param is the broadcast action, second is the app bundle
function heckcast() {
    adb shell am broadcast -a $1 -p $2
}

# Connects to a screen in the local network using Screen Sharing
function pair() {
  ip_or_hostname=$1
  if grep "^[a-zA-Z]" <<(echo $ip_or_hostname); then
    ip_or_hostname=${ip_or_hostname}.lan
  fi
  open vnc://$ip_or_hostname
}
