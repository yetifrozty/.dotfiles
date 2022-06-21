# .dotfiles
My dotfiles.

To install my dotfiles you have to first install [stow](https://www.gnu.org/software/stow/).

```
cd ~
git clone https://github.com/yetifrozty/.dotfiles
cd .dotfiles
stow .
```

Wallpapers:
https://github.com/thefallnn/Nord-Wallpapers
https://github.com/linuxdotexe/nordic-wallpapers


The polybar config uses "DejaVuSansMono" and "DejaVuSansMonoNerdFont". 
To install DejaVuSansMono on archlinux, run the follow command.
```
sudo pacman -S ttf-dejavu
```
To install the nerd font on archlinux, install the aur package "nerd-fonts-dejavu-complete".
if you dont have an aur helper, run these commands.
```
git clone https://aur.archlinux.org/nerd-fonts-dejavu-complete.git
cd nerd-fonts-dejavu-complete
makepkg -si
cd ..
rm -rf nerd-fonts-dejavu-complete
```
