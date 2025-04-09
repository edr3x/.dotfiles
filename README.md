# Dotfiles

![desktop](https://user-images.githubusercontent.com/45848083/203314137-03c75847-dde5-427a-aff3-5bef0d3d11ff.png)
![rofi](https://user-images.githubusercontent.com/45848083/203314240-ec3effc0-8929-477d-8f36-8b5bac64c711.png)
![neovim](https://user-images.githubusercontent.com/45848083/214559991-f42dfa79-ff39-41b4-8475-58351cf5d20a.png)
![md-prev](https://user-images.githubusercontent.com/45848083/214560444-5b380255-f07c-41e8-a803-cfcc581fd9f6.png)
![firefox](https://user-images.githubusercontent.com/45848083/203314824-737c6de0-8ed5-4fd0-af41-0c4d1d566a18.png)

- WM : [awesome](https://awesomewm.org/)
- Bar : [wibar](https://awesomewm.org/apidoc/popups_and_bars/awful.wibar.html)
- App Launcher : [Rofi](https://github.com/davatorium/rofi/)
- Compositor : [Picom](https://github.com/yshui/picom)
- Terminal :
    - Emulator : [Alacritty](https://alacritty.org/)
    - Shell : [Fish](https://fishshell.com/)
    - Prompt : [Starship](https://starship.rs/)
    - Font : [Fira-Code-Nerd-Font](https://github.com/ryanoasis/nerd-fonts)
- Code Editor : [Neovim](https://neovim.io/)
- Theme Manager : [lxappearance](https://archlinux.org/packages/community/x86_64/lxappearance/)
- System Font : [Iosevka-Nerd-Font](https://github.com/ryanoasis/nerd-fonts)
- Icon Theme : [Tela-circle-dracula](https://www.xfce-look.org/p/1359276/)

## Installing

```bash
sudo pacman -S awesome alacritty fish neofetch neovim picom btop rofi clipmenu starship tmux stow git-delta
```

You will need `git` and GNU `stow`

Clone into `$HOME` directory

```bash
git clone https://github.com/edr3x/.dotfiles.git 
```

Run `stow` to symlink everything or just select what you want

```bash
stow */  # For Everything
```

```bash
stow nvim # Only nvim config
```
