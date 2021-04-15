# dotfiles

## Installation 
Clone the repository:
```
git clone --bare https://github.com/mingles/dotfiles.git $HOME/.dotfiles
```

Define the alias in the current shell scope

```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Checkout the actual content from the project to your $HOME
```
dotfiles checkout
```

If the file exists, you'll get an error message. These must be deleted or backed up somewhere else.

## Usage
You can use regular git commands such as:

```
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
```
