# Mi NVIM dotfiles con 💤 LazyVim

[LazyVim](https://lazyvim.org)

## ⚡️ Requirements

    Neovim >= 0.9.0 (needs to be built with LuaJIT)
    Git >= 2.19.0 (for partial clones support)
    a Nerd Font(v3.0 or greater) (optional, but needed to display some icons)
    lazygit (optional)
    a C compiler for nvim-treesitter. See here
    for telescope.nvim (optional)
        live grep: ripgrep
        find files: fd
    a terminal that support true color and undercurl:
        kitty (Linux & Macos)
        wezterm (Linux, Macos & Windows)
        alacritty (Linux, Macos & Windows)
        iterm2 (Macos)

## Instalación de requerimientos en Fedora

* ``sudo dnf install neovim`` (Neovim con LuaJIT)
* Verificar que GIT esté instalado con ``git --version`` (Preinstalado con Fedora)
* Verificar que GCC esté instalado con ``gcc --version`` (ya se instala al instalar neovim)
* Instalar ripgrep ``sudo dnf install ripgrep``
* Instalar fd ``sudo dnf install fd-find``
* Instalar Node y NPM ``sudo dnf install node``
* Descargar una [Nerd Font](https://www.nerdfonts.com/font-downloads) (yo uso Blex Mono Nerd Font)
* Vamos a necesitar una Terminal que soporte True Color y undercurl. Mi preferencia es [Kitty](https://sw.kovidgoyal.net/kitty/)

## Antes de clonar mi repositorio

Hacemos un backup de la carpeta nvim si existiere:

* required

``mv ~/.config/nvim{,.bak}``

* optional but recommended
```
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```
## Clonar mi repositorio en la carpeta ~/.config/nvim


```git clone https://github.com/NickmDrummer/nvim ~/.config/nvim```


> [!CAUTION]
> REQUERIDO: Remover la carpeta .git para que después puedas iniciar tu propio repositorio.

```
rm -rf ~/.config/nvim/.git
```

## Iniciar NVIM!

```
nvim
```
