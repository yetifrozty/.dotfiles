#stow the dotfiles
cd ~/.dotfiles
mkdir ~/.config
stow .

#install gtk theme
mkdir ~/.themes
cd ~/.themes
git clone https://github.com/EliverLara/Nordic

#install wallpapers
mkdir -p ~/.config/nitrogen/Wallpapers
cd ~/.config/nitrogen/Wallpapers
git clone https://github.com/thefallnn/Nord-Wallpapers
git clone https://github.com/linuxdotexe/nordic-wallpapers
echo "Dont forget to add the wallpaper folder in nitrogen later!"

#install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#install the required fonts
mkdir -p ~/.local/share/fonts
mkdir ~/.dotfiles/fonts
cd ~/.dotfiles/fonts
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip
unzip JetBrainsMono-2.242.zip
mv fonts/ttf/* ~/.local/share/fonts

cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf?raw=true
wget https://github.com/ryanoasis/nerd-fonts/blob/master/src/glyphs/Symbols-1000-em%20Nerd%20Font%20Complete.ttf?raw=true

cd ~/.dotfiles
rm -rf fonts
fc-cache -f -v

#go back to the dotfiles directory
cd ~/.dotfiles
