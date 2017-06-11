#!/bin/bash

# Write out current crontab
crontab -l > mycron
# Echo new cron into cron file
echo "* * * * * ~/.dotfiles/bin/online-check.sh" >> mycron
# Install new cron file
crontab mycron
rm mycron

cp zsh/shawn.zsh-theme ~/.oh-my-zsh/themes/shawn.zsh-theme
