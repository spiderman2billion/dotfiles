#!/usr/bin/env bash

echo 'start updating ...'

echo 'updating homebrew'
brew update
echo 'updating homebrew modules'
brew upgrade
echo 'clearing homebrew cache'
brew cleanup

echo 'updating R modules'
R --vanilla --quiet -e 'update.packages(ask = FALSE, repos="http://cran.us.r-project.org")'

echo 'updating zsh - oh-my-zsh'
env ZSH="/Users/stones/.oh-my-zsh" DISABLE_UPDATE_PROMPT="true" zsh -f $ZSH/tools/check_for_upgrade.sh

echo 'updating cpan'
cpan install CPAN
echo 'updating cpan modules'
cpan-outdated -p |cpanm

echo 'updating npm'
#npm i -g npm
npm update -g

echo 'checking Apple Updates'
mas upgrade

exit 0
