# Dotfiles

![Desktop](./.screenshots/desktop.png)
![Rofi](./.screenshots/rofi.png)
![Firefox](./.screenshots/firefox.png)
![Neofetch](./.screenshots/fetch.png)
![Nvim](./.screenshots/nvim.png)
![Thunar](./.screenshots/thunar.png)

- DE : [XFCE4](https://www.xfce.org/)
- App Launcher : [Rofi](https://github.com/davatorium/rofi)
- Compositor : [Picom](https://github.com/yshui/picom)
- Terminal : [Alacritty](https://alacritty.org/)
- Terminal Font : [Fira Code](https://www.nerdfonts.com/font-downloads)
- Shell : [Fish](https://fishshell.com/)
- Terminal Prompt : [Starship](https://starship.rs/)
- Code Editor : [Neovim](https://neovim.io/)
- Nvim Theme : [Tokyonight](https://github.com/folke/tokyonight.nvim)
- Theme : [Tokyonight-Dark-B](https://www.xfce-look.org/p/1681315/)
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
