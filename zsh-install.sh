#!/bin/bash
if [ "$(uname -o)" = "Android" ]; then
  apt install zsh git -y
else
  sudo apt install zsh git -y
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed '/exec zsh -l/d') --skip-chsh --keep-zshrc"
if [ -d "$HOME/.oh-my-zsh" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
else
    echo "Oh My Zsh installation failed."
fi

if [ "$(uname -o)" = "Android" ]; then
  chsh -s zsh && zsh
else
  zsh=$(command -v zsh)
  chsh -s "$zsh" && zsh
fi
