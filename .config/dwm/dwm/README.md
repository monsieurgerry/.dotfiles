# Configuracion de DWM 🖥️
La configuracion de dwm que suck-less `chiste gastado pero nunca viejo`
hay algunos parches aplicados, atajos de teclado y cambios visuales.

## Para ti bb 😗
Para agregar la configuracion tienes que ejecutar los siguientes comandos:
```bash
mkdir -p ~/.config/dwm
cd ~/.config/dwm
git clone https://github.com/monsieurgerry/dwm
cd dwm
sudo make clean install
```
Sal de dwm y despues ya estara lista la configuracion.

Para ejecutarlo tienes que agregar la siguiente linea al .xinitrc
```bash
# some code
    exec dwm
```
Ya con eso puedes ahora correr startx y iniciara dwm sin problemas... pero recomiendo usar `` ssh-agent dwm ``
aunque esto viene de un loop, para reiniciar dwm tener ese comando vale oro.

Tambien puedes solo poner mis [dotfiles](https://github.com/monsieurgerry/.dotfiles) en tu pc
y ya no tienes que hacer nada de eso.

Cualquier cosa que quieras cambiar es en el archivo [config.h](config.h) ignora el resto. Prometo
algun dia comentar paso por paso que hace cada cosa #cleancode.
## Requisitos
Basicamente solo se requiere que tener los archivos Xlib.

## Parches instalados
- [autostart](https://dwm.suckless.org/patches/autostart)
- [restratsig](https://dwm.suckless.org/patches/restartsig)
- [colorbar](https://dwm.suckless.org/patches/colorbar/)
- [sticky](https://dwm.suckless.org/patches/sticky)

### [Pagina de suckless](https://suckless.org)
