#!/bin/sh

HOMEDIR = "./homedir"

# Copy configuration files
cp -r $HOMEDIR/.ssh $HOME/.ssh
cp -r $HOMEDIR/Developer $HOME/Developer
cp $HOMEDIR/.gitalias $HOME/.gitalias
cp $HOMEDIR/.gitconfig $HOME/.gitconfig
cp $HOMEDIR/.gitignore $HOME/.gitignore
cp $HOMEDIR/.zpreztorc $HOME/.zpreztorc
cp $HOMEDIR/.zshrc $HOME/.zshrc

chmod 400 $HOME/.ssh/id_rsa

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Prezto
brew install zsh
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh

# Install Volta
curl https://get.volta.sh | bash
volta install node
volta install yarn

# Install soft
brew install coreutils the_silver_searcher fd httpie jq exa hyperfine # autojump bat fzf
brew install iterm2 raycast telegram visual-studio-code transmission kap rectangle vlc slack --cask # docker imageoptim keka balenaetcher qlstephen qlmarkdown qlimagesize qlvideo suspicious-package quicklook-json'

# Install utilities from NPM
npm install tldr vtop trash trash-cli eslint --global

# Copy Raycast script commands
cp -r raycast_commands $HOME/raycast_commands

# Colorize iTerm2
open "./theme/material-design-colors.itermcolors";ok
defaults write com.googlecode.iterm2 PromptOnQuit -bool false;ok

# Improve macOS
defaults write -g ApplePressAndHoldEnabled -bool false;ok
defaults write NSGlobalDomain AppleShowAllExtensions -bool true;ok
defaults write com.apple.finder ShowStatusBar -bool true;ok
defaults write com.apple.finder ShowPathbar -bool true;ok
defaults write com.apple.dock mineffect -string "scale";ok

defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true;ok

defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="small-spacer-tile";}';ok
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="small-spacer-tile";}';ok
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="small-spacer-tile";}';ok
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="small-spacer-tile";}';ok
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="small-spacer-tile";}';ok

killall Dock;ok
killall Finder;ok
killall Safari;ok
