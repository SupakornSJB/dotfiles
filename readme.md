# What is this?

This is the repository where I keep my config and dotfiles. <br/>
Instruction on how to use can be seen below.

# Usage (Install script - Experimental)

Call the `install.sh` script in the terminal <br/>
Note: This is a very experimental approach, backup your file in case any thing goes wrong

# Usage (Manual)

1. Clone this repo into the home directory. (Or any directory you want, but
change the directory path in the next step from ~/.dotfiles to other)
```
  git clone git@github.com:SupakornSJB/dotfiles.git .dotfiles
```

2. Install `kitty nvim tmux zsh fzf` from pacman
```
  sudo pacman -Sy 
  sudo pacman -S kitty nvim tmux zsh fzf
```

3. To use the dotfiles, Create symlinks from the
.dotfiles directory to your .config directory. (or other directory depending on the file)<br/>

Use the following commands
```
  ln -s ~/.dotfiles/nvim ~/.config/nvim
  ln -s ~/.dotfiles/kitty ~/.config/kitty
  ln -s ~/.dotfiles/tmux ~/.config/tmux
  ln -s ~/.dotfiles/tmux-powerline ~/.config/tmux-powerline
  ln -s ~/.dotfiles/hypr ~/.config/hypr
  ln -s ~/.dotfiles/.zshrc ~/.zshrc
```

4. Install dependencies of each app
  - For nvim, install **packer** from [repo](https://github.com/wbthomason/packer.nvim) and run `:PackerSync` (For more info, Go
  to nvim submodule repo)
    - Note: Packer is likely to be unmaintained in the future, If you don't like that, use other nvim plugin such as LazyVim instead
  - For kitty, you may want to change the background picture and the font
    - Or try using the font that I'm using, JetbrainsMonoNL [Nerdfonts](https://www.nerdfonts.com/font-downloads)
  - For tmux, install `tpm` and source the tmux config file
    - `<C-space>R` to source file
    - `<C-space>I` to install plugins
  - For zsh, install [oh-my-zsh](https://ohmyz.sh/)
