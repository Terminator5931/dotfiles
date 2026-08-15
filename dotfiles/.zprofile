# Environment setup for Wayland/Sway
# export XDG_SESSION_TYPE=wayland
# export XDG_CURRENT_DESKTOP=sway
# export MOZ_ENABLE_WAYLAND=1
#
# Start sway automatically on TTY1
# if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
#     exec sway
# fi
# 
if [ -z "$XDG_RUNTIME_DIR" ]; then
  export XDG_RUNTIME_DIR="/run/user/$(id -u)"
fi
if [[ $(tty) == /dev/tty1 ]]; then
    exec sway > /dev/null 2>&1
fi

