#!/bin/sh

HOMEDIR = "./homedir"

# Copy configuration files
cp -r $HOMEDIR/.ssh $HOME/.ssh
cp $HOMEDIR/.gitalias $HOME/.gitalias
cp $HOMEDIR/.gitconfig $HOME/.gitconfig
cp $HOMEDIR/.gitignore $HOME/.gitignore
cp $HOMEDIR/.zpreztorc $HOME/.zpreztorc
cp $HOMEDIR/.zshrc $HOME/.zshrc

chmod 400 $HOME/.ssh/kitcat_rsa

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

# Install software
brew install fd jq fnm the_silver_searcher exa bat fzf tldr httpie autojump coreutils hyperfine
brew install k9s colima kubectl azure-cli sentry-cli
brew install vlc zoom slack iterm2 alt-tab raycast telegram obsidian proxyman 1password 1password-cli bitwarden gitkraken \
  transmission balenaetcher google-drive scroll-reverser google-chrome-dev visual-studio-code discord --cask

# Install utilities from NPM
npm i pnpm --global
pnpm add eslint -g # vtop

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
