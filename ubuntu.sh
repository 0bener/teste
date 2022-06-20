#!/bin/bash


############################################Anydesk 20.04 #########################################################
#Adicionando repositorio anydesk
#sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
#sudo echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
#sudo echo "deb http://archive.ubuntu.com/ubuntu/ trusty main universe restricted multiverse" >  /etc/apt/sources.list.d/anydesk-stable.list

############################################anydesk 22.04 #########################################################

sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo gpg --dearmor -o /etc/apt/keyrings/anydesk.gpg

sudo echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/anydesk.gpg] http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk.list > /dev/null


#Adcionando repositorio FreeOffice
#sudo wget -qO - https://shop.softmaker.com/repo/linux-repo-public.key | apt-key add -
#sudo echo "deb https://shop.softmaker.com/repo/apt stable non-free" > /etc/apt/sources.list.d/softmaker.list

echo "Atualizando o sistema operacional"
sudo apt-get update -y && sudo apt-get dist-upgrade -y

sudo apt install git curl wget net-tools  -y

sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
echo "Google Chrome Baixado"

#Instalando sysv-rc-conf 
sudo apt-get install sysv-rc-conf

sudo wget https://go.skype.com/skypeforlinux-64.deb
echo "Skype Baixado"

#sudo wget https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10702/wps-office_11.1.0.10702.XA_amd64.deb
#echo "WPS Office Baixado"

sudo wget https://zoom.us/client/latest/zoom_amd64.deb
echo "Zoom Baixado"

echo "Instalando Zoiper"
#git clone https://github.com/jo316dev/zoiper.git  
#sudo chmod +x zoiper/Zoiper_for_AATeleccom_Linux_64bit_v3.20.run
#sudo zoiper/Zoiper_for_AATeleccom_Linux_64bit_v3.20.run 
sudo chmod +x ./Zoiper_for_AATeleccom_Linux_64bit_v3.20.run
sudo ./Zoiper_for_AATeleccom_Linux_64bit_v3.20.run 
echo "Zoiper instalado...continuando"


#instala Free Office

echo "Instalando FreeOffice"
sudo cat softmaker.deba* > softmaker.deb
sudo chmod +x ./softmaker.deb
sudo apt install -f ./softmaker.deb 

#sudo apt install softmaker-freeoffice-2021 -y
echo "FreeOffice instalado...continuando"


echo "================================"
echo "Instalando Wine"
sudo apt install wine -y
echo "Wine instalado...continuando"

echo "Instalando flameshot"
apt install flameshot -y
echo "Flameshot instalado...continuando"

echo "================================"
echo "Instalando AnyDesk"
apt install anydesk -y
echo "Instalado Anydesk... Continuando.."


for i in *.deb; do sudo apt install -y ./$i; done

sudo apt install cinnamon-desktop-environment -y

wine ./NXCallCenter-3.20.5.exe

echo "Instalação finalizada Favor reniciar"
