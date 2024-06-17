#!/bin/bash
echo 'inicio'

# Verificar ambiente de desktop
if [ -n "$XDG_CURRENT_DESKTOP" ]; then
    if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
        echo "Ambiente de desktop: GNOME"
        # Mudando wallpaper
        gsettings set org.gnome.desktop.background picture-uri "file:///home/$(whoami)/caminho/para/wallpaper01.jpg"

        # Caminho para a imagem que você deseja usar como foto de perfil
        usuario=$(whoami)
        caminho_imagem="/home/$usuario/caminho/para/fotoperfil.png"

        # Copia a imagem para o diretório de ícones de usuário
        sudo cp "$caminho_imagem" "/var/lib/AccountsService/icons/$usuario"

        # Atualiza a configuração da conta de usuário
        sudo bash -c "cat > /var/lib/AccountsService/users/$usuario <<EOF
[User]
Icon=/var/lib/AccountsService/icons/$usuario
EOF"

    elif [[ "$XDG_CURRENT_DESKTOP" == *"XFCE"* ]]; then
        echo "Ambiente de desktop: XFCE"
        # Mudando wallpaper no XFCE
        xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s "/home/$(whoami)/caminho/para/wallpaper01.jpg"

        # Mudando foto de perfil (o processo pode variar no XFCE)
        usuario=$(whoami)
        caminho_imagem="/home/$usuario/caminho/para/fotoperfil.png"
        sudo cp "$caminho_imagem" "/var/lib/AccountsService/icons/$usuario"
        sudo bash -c "cat > /var/lib/AccountsService/users/$usuario <<EOF
[User]
Icon=/var/lib/AccountsService/icons/$usuario
EOF"

    else
        echo "Ambiente de desktop: $XDG_CURRENT_DESKTOP"
    fi
else
    echo "Ambiente de desktop: Não reconhecido"
fi

# Verificar sistema de pacotes
if command -v dpkg &>/dev/null; then
    echo "Sistema de pacotes: Debian (.deb)"

    # Baixe o arquivo .deb do Visual Studio Code
    wget https://update.code.visualstudio.com/latest/linux-deb-x64/stable -O code.deb

    # Instale o pacote .deb
    sudo apt install ./code.deb -y

    # Atualizando o S.O.
    sudo apt update -y
    sudo apt upgrade -y

    # Instalando programas base via Flatpak
    ## Comentado, ative se necessário
    flatpak install flathub com.discordapp.Discord -y
    flatpak install flathub io.github.shiftey.Desktop -y
    flatpak install flathub org.gnome.Pomodoro -y
    flatpak install flathub com.blackboxapp.BlackBox -y
    flatpak install flathub org.gnome.Boxes -y
    flatpak install flathub org.gnome.gparted -y

    # PÓS-INSTALAÇÃO
    ## Finalização, atualização e limpeza
    sudo apt update && sudo apt dist-upgrade -y
    sudo apt autoclean
    sudo apt autoremove -y
    echo 'final'
    sudo reboot

elif command -v rpm &>/dev/null; then
    echo "Sistema de pacotes: Red Hat (.rpm)"

    # Baixe o arquivo .rpm do Visual Studio Code
    wget https://update.code.visualstudio.com/latest/linux-rpm-x64/stable -O code.rpm

    # Instale o pacote .rpm
    sudo rpm -i code.rpm -y

    # Instale o pacote .rpm
    sudo rpm -i code_1.90.1-1718141439_amd64.rpm

    # Atualizando o S.O.
    sudo dnf update -y

    # Instalando programas base via Flatpak
    ## Comentado, ative se necessário

    flatpak install flathub com.discordapp.Discord -y
    flatpak install flathub io.github.shiftey.Desktop -y
    flatpak install flathub org.gnome.Pomodoro -y
    flatpak install flathub com.blackboxapp.BlackBox -y
    flatpak install flathub org.gnome.Boxes -y
    flatpak install flathub org.gnome.gparted -y

    # PÓS-INSTALAÇÃO
    ## Finalização, atualização e limpeza
    sudo dnf update -y
    sudo dnf autoremove -y
    echo 'final'
    sudo reboot

else
    echo "Sistema de pacotes: Não reconhecido"
fi
