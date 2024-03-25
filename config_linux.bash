#! /bin/sh
echo 'inicio'

# atualizando oS.o
sudo apt upgrade -y

# atualizando repositorio
sudo apt update -y

#instalando programas base
echo 'instalndo o code'
sudo apt install code -y
if [ $? -eq 0 ]; then
    echo "Instalação bem-sucedida."
    # Coloque aqui os comandos que deseja executar se a instalação for bem-sucedida
else
    echo "Erro durante a instalação. O script será interrompido."
    exit 1  # Encerra o script com código de saída 1 (ou qualquer outro código de erro)
fi
echo 'instalndo o github'
sudo apt install github-desktop -y
if [ $? -eq 0 ]; then
    echo "Instalação bem-sucedida."
    # Coloque aqui os comandos que deseja executar se a instalação for bem-sucedida
else
    echo "Erro durante a instalação. O script será interrompido."
    exit 1  # Encerra o script com código de saída 1 (ou qualquer outro código de erro)
fi
echo 'instalndo o pomodoro'
sudo apt-get install gnome-shell-pomodoro -y
if [ $? -eq 0 ]; then
    echo "Instalação bem-sucedida."
    # Coloque aqui os comandos que deseja executar se a instalação for bem-sucedida
else
    echo "Erro durante a instalação. O script será interrompido."
    exit 1  # Encerra o script com código de saída 1 (ou qualquer outro código de erro)
fi
echo 'instalndo o nodejs'
sudo apt install nodejs -y
if [ $? -eq 0 ]; then
    echo "Instalação bem-sucedida."
    # Coloque aqui os comandos que deseja executar se a instalação for bem-sucedida
else
    echo "Erro durante a instalação. O script será interrompido."
    exit 1  # Encerra o script com código de saída 1 (ou qualquer outro código de erro)
fi
echo 'instalndo o npm'
sudo apt install npm -y
if [ $? -eq 0 ]; then
    echo "Instalação bem-sucedida."
    # Coloque aqui os comandos que deseja executar se a instalação for bem-sucedida
else
    echo "Erro durante a instalação. O script será interrompido."
    exit 1  # Encerra o script com código de saída 1 (ou qualquer outro código de erro)
fi
echo 'instalndo o gparted'
sudo apt install gparted -y
if [ $? -eq 0 ]; then
    echo "Instalação bem-sucedida."
    # Coloque aqui os comandos que deseja executar se a instalação for bem-sucedida
else
    echo "Erro durante a instalação. O script será interrompido."
    exit 1  # Encerra o script com código de saída 1 (ou qualquer outro código de erro)
fi
echo 'instalndo o discord'
sudo apt install discord -y
if [ $? -eq 0 ]; then
    echo "Instalação bem-sucedida."
    # Coloque aqui os comandos que deseja executar se a instalação for bem-sucedida
else
    echo "Erro durante a instalação. O script será interrompido."
    exit 1  # Encerra o script com código de saída 1 (ou qualquer outro código de erro)
fi

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y
sudo reboot
# ---------------------------------------------------------------------- #
echo 'final'

