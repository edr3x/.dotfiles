# Dotfiles

![desktop](https://user-images.githubusercontent.com/45848083/198842889-7b6b4a56-6175-4d6d-87c9-e4620f7951f6.png)
![rofi](https://user-images.githubusercontent.com/45848083/198842904-54399bed-09ac-46bf-bd41-dfd4eecc1e9b.png)
![firefox](https://user-images.githubusercontent.com/45848083/198842916-f6a934cd-0205-48fd-9058-0422af2c4e48.png)
![fetch](https://user-images.githubusercontent.com/45848083/198842920-5715610c-4a8f-4034-98d3-ad3638e576ee.png)
![nvim](https://user-images.githubusercontent.com/45848083/198842932-e0cdc8ba-99fd-4302-9f76-42033f9699c1.png)
![thunar](https://user-images.githubusercontent.com/45848083/198842947-62a736b7-9eeb-4411-8372-c899de40b2ff.png)

- DE : [XFCE4](https://www.xfce.org/)
- Bar : [XFCE bar](https://www.xfce.org/)
- App Launcher : [Rofi](https://github.com/davatorium/rofi/)
- Compositor : [Picom](https://github.com/yshui/picom)
- Terminal :
    - Emulator : [Alacritty](https://alacritty.org/)
    - Theme : [Modified Tokyonight]()
    - Shell : [Fish](https://fishshell.com/)
    - Prompt : [Starship](https://starship.rs/)
    - Font : [Fira Code](https://www.nerdfonts.com/font-downloads)
- Code Editor : [Neovim](https://neovim.io/)
- Theme : [Tokyonight-Dark-B](https://www.xfce-look.org/p/1681315/)
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
