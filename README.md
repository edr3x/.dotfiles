# Dotfiles

![Desktop](./.screenshots/desktop.png)
![Rofi](./.screenshots/rofi.png)
![Firefox](./.screenshots/firefox.png)
![Neofetch](./.screenshots/fetch.png)
![Nvim](./.screenshots/nvim.png)
![Thunar](./.screenshots/thunar.png)

- Theme: [Tokyonight-Dark-B](https://www.xfce-look.org/p/1681315/)
- Icon : [Tela-circle-dracula](https://www.xfce-look.org/p/1359276/)

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
