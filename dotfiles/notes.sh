#!/usr/bin/bash
# ;colon; sh %s 1(phone to PC) or 2 or nothing at all
var1=`~/Downloads/platform-tools/./adb -s 192.168.1.39:5555 forward --list`
var2=`pgrep adb`
# ipaddr=192.168.1.39
if [[ -z $var1 || -z $var2 ]]; then
  ~/Downloads/platform-tools/./adb connect 192.168.1.39:5555 > /dev/null
  ~/Downloads/platform-tools/./adb -s 192.168.1.39:5555 forward tcp:60873 tcp:60873 > /dev/null
fi
# echo -e '1 mobile to PC\n2 PC to mobile\n3 kill server\c'
# read -r choice
# case $choice in
case $@ in
  1)
    rsync -a --delete --exclude-from=$(realpath ~/rsync_excludefiles.txt) rsync://localhost:60873/root/storage/emulated/0/Documents/Transform/ $(realpath ~/Transform)
    # rsync -anv --delete --exclude='/Android' -e 'ssh -p 60022' ${ipaddr}:/storage/emulated/0/ Internal/
    # rsync -anv --delete --exclude-from=$(realpath ~/rsync_excludefiles.txt) -e 'ssh -i .ssh/id_ed25519 -p 8022' ${ipaddr}:/storage/emulated/0/Documents/Transform/ $(realpath ~/Transform)
    ;;
  2)
    rsync -a --delete --exclude-from=$(realpath ~/rsync_excludefiles.txt) "$(realpath ~/Transform)"/ rsync://localhost:60873/root/storage/emulated/0/Documents/Transform/
    # rsync -anv --delete --exclude-from=$(realpath ~/rsync_excludefiles.txt) -e 'ssh -i .ssh/id_ed25519 -p 8022' "$(realpath ~/Transform)"/ ${ipaddr}:/storage/emulated/0/Documents/Transform
    ;;
  *)
    ~/Downloads/platform-tools/./adb disconnect
    ~/Downloads/platform-tools/./adb kill-server
    ;;
esac
