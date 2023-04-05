# LF

## Requires for preview

```sh
sudo pacman -S ueberzug ffmpegthumbnailer imagemagick poppler
```

- add [this script](https://github.com/edr3x/.dotfiles/blob/master/scripts/.local/scripts/lfimg) to your path and with name `lfimg` or any name you prefer
- now alias this script in your `.bashrc` or `.zshrc` for `config.fish`

```bash
alias lf="lfimg"
```

this then runs the script which then would be able to utilize image preview feature

## After this run following command

```sh
xauth generate :0 . trusted
```
