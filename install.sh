#!/usr/bin/env bash
BASEDIR=$(dirname $0)
CONFIGDIR="$HOME/.config"
DIRARR=("hypr" "kitty" "nvim" "ranger" "tmux" "tmux-powerline")

printf "Script Location: ${BASEDIR}"
printf "Installable Packages and its dependencies from Pacman"
printf " - kitty"
printf " - neovim"
printf " - ranger"
printf " - tmux"
printf " - zsh"
printf " - thefuck"
printf " - fzf (Used By: tmux-sessionizer, neovim)"
printf " - ripgrep (Used By: neovim)"
printf " - npm (Used By: neovim)"
printf " - cmake (Used By: neovim)"

read -p "Would you like to use Pacman to install these packages? (Arch Only) [y/n]: "
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  printf "Initializing Install from Pacman"
  sudo pacman -Sy
  sudo pacman -S kitty neovim tmux zsh fzf thefuck ripgrep npm cmake
  printf "Finishing Install from Pacman"
fi

printf "--------------------------------------------------------------------"
printf "Initializing Config Symlink"
# Symlink to all in the .config folder
for i in ${DIRARR[@]}
do
  if [ ! -d "$CONFIGDIR/$i" ]; then 
    ln -s "$BASEDIR/$i" "$CONFIGDIR/$i"
  else 
    printf "Cannot install $i Config, $i directory already exist"
  fi
done
 
# Symlink the .zshrc
if [ ! -e "$HOME/.zshrc" ]; then 
  ln -s  "$BASEDIR/.zshrc" "$HOME/.zshrc"
else 
  printf "Cannot install zsh Config, .zshrc file already exist"
fi
printf "Finishing Config Symlink"
printf "--------------------------------------------------------------------"

printf "Synlinking Config directory has finished, Installed app has additional optional dependencies"
printf " - Packer (nvim)"
printf " - TPM: Tmux Plugin Manager (Tmux)"
printf " - Tmux-powerline (Tmux)"
printf " - Oh My Zsh (zsh)"

read -p "Would you like to install all others dependencies as well? [y/n]"
if [ ! $REPLY =~ ^[Yy]$ ] 
then
  printf "Initializing Dependencies Install"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  printf "Finishing Dependencies Install"
fi

printf "--------------------------------------------------------------------"
printf "Some of the packages should be install manually including: "
printf " - Jetbrain Mono Font (kitty), or change this to your preferred font in kitty.conf"
printf "List of things to do to finish the installation"
printf " - Install Packer Plugins (nvim)"
printf "  1. Enter Neovim"
printf "  2. Run :PackerSync"
printf " - Source and install TPM packages"
printf "  1. Enter Tmux"
printf "  2. Press <Ctrl-Space>I to install tpm"
printf "  3. Press <Ctrl-Space>R to source tmux"
printf "That's it! Enjoy!"
printf "--------------------------------------------------------------------"
