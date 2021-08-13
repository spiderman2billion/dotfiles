# From http://dotfiles.org/~_why/.zshrc
# Sets the window title nicely no matter where you are
#
function title() {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\ek$a:$3\e\\" # screen title (in ^A")
    ;;
  xterm*|rxvt)
    #print -Pn "\e]2;$2$(prompt_online)\a" # plain xterm title ($3 for pwd)
    if [[ -f ~/.offline ]]; then
      printf $'\033]6;1;bg;red;brightness;255\a'
      print -Pn "\e]2;$2\a" # plain xterm title ($3 for pwd)
    else
      printf $'\033]6;1;bg;*;default\a'
      print -Pn "\e]2;$1\a" # plain xterm title ($3 for pwd)
    fi
    ;;
  esac
}

