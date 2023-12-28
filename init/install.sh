#!/bin/bash

DOTFILES_REPO="https://github.com/agodoriru/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

# clone dotfiles repo
git clone "$DOTFILES_REPO" "$DOTFILES_DIR" || {
    echo "Failed to clone dotfiles repository."
    exit 1
}
echo "clone dotfiles success"

# backup
mkdir -p "$HOME/dotfiles_backup"
mv "$HOME/.vimrc" "$HOME/dotfiles_backup/.vimrc_backup" 2>/dev/null
mv "$HOME/.tmux.conf" "$HOME/dotfiles_backup/.tmux.conf_backup" 2>/dev/null
mv "$HOME/.zshrc" "$HOME/dotfiles_backup/.zshrc_backup" 2>/dev/null
mv "$HOME/.config/starship.toml" "$HOME/dotfiles_backup/starship.toml" 2>/dev/null
echo "backup dotfiles success"

# install tools
# Install starship if not already installed
if ! command -v starship &> /dev/null; then
    echo "Installing starship..."
    sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes
fi


# link
ln -s "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"
ln -s "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
ln -s "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
mkdir -p "$HOME/.config"
ln -s "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

echo "Dotfiles installation complete!"

# vim package installer
curl -fLo ~/.vim/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
curl -sL install-node.vercel.app/lts | bash -s -- --yes 
