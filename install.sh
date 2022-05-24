#stow the dotfiles
cd ~/.dotfiles
mkdir ~/.config
stow .

#install wallpapers
mkdir ~/.config/nitrogen
cd ~/.config/nitrogen
git clone https://github.com/thefallnn/Nord-Wallpapers
git clone https://github.com/linuxdotexe/nordic-wallpapers
echo "Dont forget to add the wallpaper folder in nitrogen later!"

#install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim