# Dotfiles

![desktop](https://user-images.githubusercontent.com/45848083/201687053-4b0e3c7e-836a-4714-92a5-78f14f34c040.png)
![rofi](https://user-images.githubusercontent.com/45848083/201734117-24f3be65-18fa-4239-8a11-53b2dc30d5c0.png)
![fetch](https://user-images.githubusercontent.com/45848083/201687532-6a597cda-4315-4af9-824e-7c12d86f35d4.png)
![nvim](https://user-images.githubusercontent.com/45848083/201734727-be0faea7-7fa7-4b13-b302-03c1dfd08be0.png)
![firefox](https://user-images.githubusercontent.com/45848083/202175460-a3b369f8-c9b9-423f-8db0-df3ba2455372.png)

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
sudo pacman -S alacritty fish neofetch neovim picom btop rofi starship tmux
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
