# vim customizations for developing in python

vim version should be higher than 7.3. These customizations are based on these [tips](https://realpython.com/vim-and-python-a-match-made-in-heaven/).

## Requirements

### 1. Install Vundle into your `~/.vim` folder
`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

### 2. Install YouCompleteMe requirements
1. Install YouCompleteMe with Vundle.

2. Install development tools and CMake:

`apt-get install build-essential cmake`

3. Make sure you have Python headers installed:

`apt-get install python-dev python3-dev`

4. (Optional) Compiling YCM with semantic support for C-family languages:

```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```

5. (Optional) Set code completion to be compatible with virtualenv
To set the interpreter to python2, install `vim.nox-py2`:

`aptitude install vim-nox-py2`,

run `update-alternatives` to activate it:

`update-alternatives --config vim`

and select the number corresponding to `vim.nox-py2`.

#### References:
- https://askubuntu.com/questions/284957/vi-getting-multiple-sorry-the-command-is-not-available-in-this-version-af/750768#750768
- https://www.raditha.com/blog/archives/mint-upgrade/
- https://stackoverflow.com/questions/6357361/alternative-to-execfile-in-python-3/6357418#6357418

### 4. Install powerline fonts for proper visualization
Run the following:
```
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

mkdir -p ~/.local/share/fonts
mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/

mkdir -p ~/.config/fontconfig/conf.d
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
```
And then restart the terminal.

### 6. Install `flake8` (required by vim-flake8)

```
pip install flake8
```

### 5. (If you are a tmux user) Add color pallete to tmux
1. Set .tmux.conf:

`set -g default-terminal "screen-256color"`

2. And run tmux as (or maybe set an alias):

`TERM=xterm-256color tmux`

#### References
- https://unix.stackexchange.com/questions/1045/getting-256-colors-to-work-in-tmux

## Installation
1. Install vim

2. Install requirements

3. Clone this repository

4. Symlink `~/.vimrc` to `vim4py/.vimrc`:

```
ln -s vim4py/.vimrc ~/.vimrc
```

5. Install plugins

```
vim +PluginInstall +qall
```

## TODO
- Add other useful plugins such as smart parentheses/brackets
- Add PyUnit plugin

