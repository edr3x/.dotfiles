# Dotfiles

![desktop](https://user-images.githubusercontent.com/45848083/202978298-4aba3969-5c10-4db6-94c1-8d4d678401ad.png)
![rofi](https://user-images.githubusercontent.com/45848083/202978750-f6807663-a065-442d-a1fe-22a422499aaa.png)
![fetch](https://user-images.githubusercontent.com/45848083/202978129-11fc0306-e4dd-4a01-a4cc-d6ee0880dd3d.png)
![nvim](https://user-images.githubusercontent.com/45848083/202977955-dc4cdb59-6c32-4447-add8-1ff85428d3f2.png)
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
