# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -F --color"
  alias ll="gls -lF --color"
  alias lll='gls -lAF --color'
fi
