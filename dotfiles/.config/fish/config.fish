# Put environment variables (set -gx EDITOR nvim, PATH changes) in config.fish without a guard. They need to exist for every shell, including scripts started by programs like editors or your window manager.
# Put aliases, abbreviations, prompt settings, and key bindings inside if status is-interactive, since they do nothing useful in a script.
# Put one-time login actions, like starting sway, inside if status is-login.
# login(one time) > interactive(terminal invoke) > non-interactive shell(script)
# global scope is inherited by all shell modes
if status is-login
  exec sway > /dev/null 2>&1
end
if status is-interactive
  # Commands to run in interactive sessions can go here
  abbr -a n nvim
  abbr -a lgdotfiles GIT_DIR="$HOME/.myconfig"\
    GIT_WORK_TREE=(pwd) lazygit
  # abbr -a FZF_DEFAULT_OPTS="--bind ctrl-j:accept,ctrl-y:accept"
  # bind \cn execute
end
# set -gx EDITOR nvim
set -U fish_greeting
