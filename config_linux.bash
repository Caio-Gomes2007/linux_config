#!/bin/bash
echo 'inicio'

programa=('code' 'discord' 'github-desktop' 'gnome-shell-pomodoro' 'nodejs' 'npm' 'gparted')

# atualizando o S.O.
sudo apt upgrade -y

# atualizando o repositório
sudo apt update -y

# instalando programas base
for i in ${!programa[@]}; do
    echo "Instalando ${programa[$i]}"
    sudo apt install -y ${programa[$i]}
    if [ $? -eq 0 ]; then
        echo "Instalação bem-sucedida."
    else
        echo "Erro durante a instalação. O script será interrompido."
        exit 1
    fi
done

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y
## sudo reboot
# ---------------------------------------------------------------------- #
echo 'final'
