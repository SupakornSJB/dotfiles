#!/usr/bin/env bash
BASEDIR=$(dirname $0)
CONFIGDIR="$HOME/.config"
DIRARR=("hypr" "kitty" "nvim" "tmux" "tmux-powerline")

echo "Script Location: ${BASEDIR}"
echo "Installable Packages from Pacman"
echo " - kitty"
echo " - neovim"
echo " - tmux"
echo " - zsh"
echo " - fzf"
read -p "Would you like to use Pacman to install these packages? (Arch Only) [y/n]: "
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  echo "Initializing Install from Pacman"
  sudo pacman -Sy
  sudo pacman -S kitty nvim tmux zsh fzf
  echo "Finishing Install from Pacman"
fi

echo "--------------------------------------------------------------------"
echo "Initializing Config Symlink"
# Symlink to all in the .config folder
for i in ${DIRARR[@]}
do
  if [ ! -d "$CONFIGDIR/$i" ]; then 
    ln -s "$BASEDIR/$i" "$CONFIGDIR/$i"
  else 
    echo "Cannot install $i Config, $i directory already exist"
  fi
done
 
# Symlink the .zshrc
if [ ! -e "$HOME/.zshrc" ]; then 
  ln -s  "$BASEDIR/.zshrc" "$HOME/.zshrc"
else 
  echo "Cannot install zsh Config, .zshrc file already exist"
fi
echo "Finishing Config Symlink"
echo "--------------------------------------------------------------------"

echo "Synlinking Config directory has finished, would you like to install its dependency as well?"
echo " - Packer (nvim)"
echo " - TPM: Tmux Plugin Manager (Tmux)"
echo " - Tmux-powerline (Tmux)"
echo " - Oh My Zsh (zsh)"
read -p "Would you like to install all others dependencies as well? [y/n]"
if [ ! $REPLY =~ ^[Yy]$ ] 
then
  echo "Initializing Dependencies Install"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "Finishing Dependencies Install"
fi

echo "--------------------------------------------------------------------"
echo "Some of the packages should be install manually including: "
echo " - Jetbrain Mono Font (kitty), or change this to your preferred font in kitty.conf"
echo "List of things to do to finish the installation"
echo " - Install Packer Plugins (nvim)"
echo "  1. Enter Neovim"
echo "  2. Run :PackerSync"
echo " - Source and install TPM packages"
echo "  1. Enter Tmux"
echo "  2. Press <Ctrl-Space>I to install tpm"
echo "  3. Press <Ctrl-Space>R to source tmux"
echo "That's it! Enjoy!"
