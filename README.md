# dotfiles

#### Installation

```shell
cd ~/.config
git clone https://github.com/shank03/dotfiles.git
ln -s dotfiles/nvim nvim
ln -s dotfiles/tmux tmux
ln -s dotfiles/ghostty ghostty
ln -s dotfiles/tuicr tuicr
mkdir -p opencode
cd opencode
ln -s ../dotfiles/opencode/themes themes
```

> Note: Make sure to rename or remove existing `nvim` or `tmux` folders

#### Ghostty themes (vesper)

Set `theme = vesper-light` (or `vesper-dark`) in settings.

