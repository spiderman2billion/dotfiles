# dotfiles 

##bootstraping:
* install xcode
* install git
  *  git config --global user.name "MYNAME"
  *  git config --global user.email "MYEMAIL"
  *  git config --global core.editor vi
  *  ssh-keygen -t rsa
  *  copy to github
     *  cat ~/.ssh/id_rsa.pub | pbcopy
     *  to github.com/settings/keys
* git clone http://github.com/spiderman2billion/dotfiles
* mv dotfiles .dotfiles
* .dotfiles/setupClean/apply_default_settings
* .dotfiles/setupClean/install_app_store
* .dotfiles/setupClean/install_homebrew_casks
* .dotfiles/setupClean/install_homebrew_formulas
* .dotfiles/setupClean/install_perlbrew
* .dotfiles/setupClean/install_perlModes
* .dotfiles/setupClean/install_vsCode
* .dotfiles/setupClean/install_RModules

## parts taken from
holeman
plekhanov
bkuhlman
oh-my-zsh
