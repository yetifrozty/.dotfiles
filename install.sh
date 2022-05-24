cd ~/.dotfiles
mkdir ~/.config
mkdir ~/.config/nitrogen
stow .
cd ~/.config/nitrogen
git clone https://github.com/thefallnn/Nord-Wallpapers
git clone https://github.com/linuxdotexe/nordic-wallpapers
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Dont forget to add the wallpaper folder in nitrogen later!"
