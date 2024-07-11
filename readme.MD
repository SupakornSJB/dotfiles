# What is this?

This is the repository where I keep my config and dotfiles. <br/>

Instruction on how to use can be seen below

# Usage

1. Clone this repo into the home directory (Or any directory you want, but
change the directory path in the next step from ~/.dotfiles to other)
```
  git clone git@github.com:SupakornSJB/dotfiles.git .dotfiles
```

2. To use the dotfiles, Clone this repo and create the symlink from the
dotfiles to your .config folder <br/>

Use the following commands
```
  ln -s ~/.dotfiles/nvim ~/.config/nvim
  ln -s ~/.dotfiles/kitty ~/.config/kitty
  ln -s ~/.dotfiles/tmux ~/.config/tmux
  ln -s ~/.dotfiles/.zshrc ~/.zshrc
```

3. Install dependencies of each app
  - For nvim, install packer from repo and run :PackerSync (For more info, Go
  to nvim submodule repo)
  - For kitty, change the background to other pictures
  - For tmux, install and source the tmux config file
  - For zsh, install oh-my-zsh
