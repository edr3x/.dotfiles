# Dotfiles

![desktop](https://user-images.githubusercontent.com/45848083/201687053-4b0e3c7e-836a-4714-92a5-78f14f34c040.png)
![fetch](https://user-images.githubusercontent.com/45848083/201687532-6a597cda-4315-4af9-824e-7c12d86f35d4.png)
![firefox](https://user-images.githubusercontent.com/45848083/201690200-38036d66-b315-4565-ba4b-737bbb7e48f3.png)
![rofi](https://user-images.githubusercontent.com/45848083/198842904-54399bed-09ac-46bf-bd41-dfd4eecc1e9b.png)
![nvim](https://user-images.githubusercontent.com/45848083/198842932-e0cdc8ba-99fd-4302-9f76-42033f9699c1.png)

- WM : [awesome](https://awesomewm.org/)
- Bar : [wibar](https://awesomewm.org/)
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
