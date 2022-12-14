# Dotfiles

![desktop](https://user-images.githubusercontent.com/45848083/203314137-03c75847-dde5-427a-aff3-5bef0d3d11ff.png)
![rofi](https://user-images.githubusercontent.com/45848083/203314240-ec3effc0-8929-477d-8f36-8b5bac64c711.png)
![tiles](https://user-images.githubusercontent.com/45848083/203383190-4a23bbc3-47c7-4f0e-a499-6226eecf965c.png)
![neovim](https://user-images.githubusercontent.com/45848083/211153511-025e2a49-53ec-4e38-8c07-8eb040ee3ee0.png)
![md-prev](https://user-images.githubusercontent.com/45848083/203316229-e9ea2784-84bc-4705-aa6e-903d7c106b81.png)
![firefox](https://user-images.githubusercontent.com/45848083/203314824-737c6de0-8ed5-4fd0-af41-0c4d1d566a18.png)

- WM : [awesome](https://awesomewm.org/)
- Bar : [wibar](https://awesomewm.org/apidoc/popups_and_bars/awful.wibar.html)
- App Launcher : [Rofi](https://github.com/davatorium/rofi/)
- Compositor : [Picom](https://github.com/yshui/picom)
- Terminal :
    - Emulator : [Alacritty](https://alacritty.org/)
    - Shell : [Fish](https://fishshell.com/)
    - Prompt : [Starship](https://starship.rs/)
    - Font : [Fira Code](https://www.nerdfonts.com/font-downloads)
- Code Editor : [Neovim](https://neovim.io/)
- Theme Manager : [lxappearance](https://archlinux.org/packages/community/x86_64/lxappearance/)
- System Font : [Iosevka-Regular](https://github.com/be5invis/Iosevka)
- Icon Theme : [Tela-circle-dracula](https://www.xfce-look.org/p/1359276/)

## Installing

```bash
sudo pacman -S alacritty fish neofetch neovim picom btop rofi starship tmux stow git-delta
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
