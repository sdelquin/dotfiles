# https://unix.stackexchange.com/a/226946
HISTCONTROL=
isnewline () {
  # read the last history number
  prompt_command__isnewline__last="$prompt_command__isnewline__curr"
  # get the current history number
  prompt_command__isnewline__curr="$(history 1 | grep -oP '^\ +\K[0-9]+')"
  [ "$prompt_command__isnewline__curr" = "$prompt_command__isnewline__last" ] && \
    ll
}
starship_precmd_user_func="isnewline"
