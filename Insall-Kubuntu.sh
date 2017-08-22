#!/bin/bash   
#
# -------------------------------------------------------------------------
#   @Programa 
# 	@name: instalaKubuntu.sh
#	@versao: 0.0
#	@Data 16 de Agosto de 2017
#	@Copyright: SEG Tecnologia, 2010 - 2017
# --------------------------------------------------------------------------
# Variaveis
#LOG=/var/log/`date +%Y-%m-%d`-instalacao.txt
LOG=/var/log/Instalacao.txt
TITULO="InstalaKubuntu - v.0.0";
BANNER="http://www.seg.eti.br";
DIRETORIO="/etc/Suporte";
URL_TEAM="http://download.teamviewer.com/download/teamviewer_i386.deb";
URL_WEBMIN="http://prdownloads.sourceforge.net/webadmin/webmin_1.850_all.deb"
URL_USR="";
URL_VSKY="";
URL_SPT="";
CONTATO="RAFAEL NETO - RAMAL 3259 - BARBACENA";
DATA=`date +%d/%m/%Y-%H:%M:%S`
echo "
 --------------------------------------------------------------------------------
|                                                                                |
|  ____  _____ ____   _____ _____ ____ _   _  ___  _     ___   ____ ___    _     |
| / ___|| ____/ ___| |_   _| ____/ ___| \ | |/ _ \| |   / _ \ / ___|_ _|  / \    |
| \___ \|  _|| |  _    | | |  _|| |   |  \| | | | | |  | | | | |  _ | |  / _ \   |
|  ___) | |__| |_| |   | | | |__| |___| |\  | |_| | |__| |_| | |_| || | / ___ \  |
| |____/|_____\____|   |_| |_____\____|_| \_|\___/|_____\___/ \____|___/_/   \_\ |
|                                                                                |
|                                                                                |
|                              Telefonia IP & Call Center, Integração de Filiais |
|                                         Segurança de Redes/Informação, CFTV IP |
|                                           Projetos, Internetworking & Soluções |
|                                           Suporte, Outsourcing & Monitoramento |
|                                                                 seg@seg.eti.br |
|                                                                 www.seg.eti.br |
|                                                               +55 38 3218 8470 |
|                                                               +55 38 3216 9282 |
 --------------------------------------------------------------------------------
| instalaKubuntu.sh    | Instalação Automática Kubuntu SAMU 192                  |
 --------------------------------------------------------------------------------				
"
sleep 5

clear

#######################################################################################  MAIN_MENU
MAIN_MENU (){

menu01Option=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --menu "Selecione a opção desejada:" --fb 15 50 6 \
"1" "Instalação Completa" \
"2" "Instalação de Programas Baíscos" \
"3" "Instalação TeawViewr" \
"4" "Instalação Webmin" \
"5" "Instalação Java Oracle" \
"6" "Download Vsky" \
"7" "Cria as Crons e Scripts" \
"8" "Cria Usuário" \
"9" "Fazer atualizações" \
"10" "Configura IP" \
"11" "Remover Programas Desnecessários" \
"12" "About" \
"13" "Exit" 3>&1 1>&2 2>&3)
 
status=$?

if [ $status != 0 ]; then
	whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "
	
ORBIGADO!

Copyright:
- SEG Tecnologia - BARBACENA

Licence:
- GPL v3 <http://www.gnu.org/licenses/>
	
" --fb 0 0 0
	exit;
fi

}

#######################################################################################  DIRETORIO
CRIA_DIRETORIO(){
echo " " >> $LOG
echo " " >> $LOG
echo "|--------------------------------------------------------------|" >> $LOG
echo " $DATA - INICIO - DIRETORIO CRIADO" >> $LOG;
if [ ! -d $DIRETORIO ]; then
	  sudo mkdir -p $DIRETORIO;
	fi
echo " $DATA - FINAL - DIRETORIO CRIADO" >> $LOG;
echo "|--------------------------------------------------------------|" >> $LOG
echo " " >> $LOG
echo " " >> $LOG
}
#######################################################################################  LIBERAR IPTABLES
LIBERA_UFW(){
echo " " >> $LOG
echo " " >> $LOG
echo "|--------------------------------------------------------------|" >> $LOG
echo " $DATA - INICIO - LIBERAR FIREWALL ">> $LOG;
sudo iptables-save > $DIRETORIO/firewall.txt
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X
sudo iptables -t mangle -F
sudo iptables -t mangle -X
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo ip6tables-save > $DIRETORIO/firewall-6.txt
sudo ip6tables -X
sudo ip6tables -t mangle -F
sudo ip6tables -t mangle -X
sudo ip6tables -P INPUT ACCEPT
sudo ip6tables -P FORWARD ACCEPT
sudo ip6tables -P OUTPUT ACCEPT
echo " $DATA - FINAL - LIBERAR FIREWALL" >> $LOG;
echo "|--------------------------------------------------------------|" >> $LOG
echo " " >> $LOG
echo " " >> $LOG
}
######################################################################################## 2 - PROGRAMAS BÁSICOS
BASICOS(){
echo " " >> $LOG
echo " " >> $LOG
echo "|--------------------------------------------------------------|" >> $LOG
echo " $DATA - INICIO - Programas Básicos Instalados" >> $LOG;
sudo apt-get install ssh
sudo apt-get install aptitude
sudo aptitude install net-tools
sudo aptitude install kdialog
echo " $DATA - FINAL - Programas Básicos Instalados" >> $LOG;
echo "|--------------------------------------------------------------|" >> $LOG
echo " " >> $LOG
echo " " >> $LOG
}
######################################################################################## 3 - TEAMVIEWR
TEAMVIWER(){
echo " " >> $LOG
echo " " >> $LOG
echo "|--------------------------------------------------------------|" >> $LOG
echo " $DATA - INICIO - TEAMVIWER" >> $LOG;
cd $DIRETORIO
wget $URL_TEAM -O teamviewer.deb
sudo dpkg -i teamviewer.deb
sudo apt-get install -f -y
echo " $DATA - FINAL - TEAMVIWER" >> $LOG;
echo "|--------------------------------------------------------------|" >> $LOG
echo " " >> $LOG
echo " " >> $LOG
}
######################################################################################## 4 - WEBMIN
WEBMIN(){
echo " " >> $LOG
echo " " >> $LOG
echo "|--------------------------------------------------------------|" >> $LOG
echo " $DATA - INICIO - WEBMIN" >> $LOG;
cd $DIRETORIO
wget $URL_WEBMIN -O webmin.deb
sudo dpkg -i webmin.deb
sudo apt-get install -f
echo " $DATA - FINAL - WEBMIN " >> $LOG;
echo "|--------------------------------------------------------------|" >> $LOG
echo " " >> $LOG
echo " " >> $LOG
}
#######################################################################################  5 - JAVA ORACLE
JAVA(){
echo " " >> $LOG
echo " " >> $LOG
echo "|--------------------------------------------------------------|" >> $LOG
echo " $DATA - INICIO - JAVA" >> $LOG;
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default
echo " $DATA - FINAL - JAVA " >> $LOG;
echo "|--------------------------------------------------------------|" >> $LOG
echo " " >> $LOG
echo " " >> $LOG
}
#######################################################################################  6 - VSKY
VSKY(){
echo " " >> $LOG
echo " " >> $LOG
echo "|--------------------------------------------------------------|" >> $LOG
echo " $DATA - INICIO - VSKY " >> $LOG;
cd $DIRETORIO
wget $URL_VSKY
echo " $DATA - FINAL - VSKY " >> $LOG;
echo "|--------------------------------------------------------------|" >> $LOG
echo " " >> $LOG
echo " " >> $LOG
}
#######################################################################################  7 - CRONS E SCRIPTS
CRONS(){
echo " " >> $LOG
echo " " >> $LOG
echo "|--------------------------------------------------------------|" >> $LOG
echo " $DATA - INICIO - CRONS " >> $LOG;
echo -e "00 */1 * * * /usr/bin/mensagem.sh                                                                                                                                                                     
* * * * *  ps aux | grep java |awk '{ if (($3) >= 100) print "/usr/bin/Suporte/Vsky.sh"}'|sh                                                                                                          
* * * * *  sleep 30 && ps aux | grep java |awk '{ if (($3) >= 100) print "/usr/bin/Suporte/Vsky.sh"}'|sh " >> /etc/crontab;
/etc/init.d/cron restart;
echo " $DATA - FINAL - CRONS " >> $LOG;
echo "|--------------------------------------------------------------|" >> $LOG
echo " " >> $LOG
echo " " >> $LOG
}
#######################################################################################  8 - CRIA USUÁRIO
USUARIO(){
echo " " >> $LOG
echo " " >> $LOG
echo "|--------------------------------------------------------------|" >> $LOG
echo " $DATA - INICIO - USUÁRIO " >> $LOG;
cd $DIRETORIO
wget $URL_USR -O usuario.users
tar -xvzpf backup.users -C /
USER=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --inputbox "Digite o nome do Usuário:" --fb 10 60 3>&1 1>&2 2>&3)
sudo usermod -d /home/$USER -m medico1
sudo usermod -l $USER medico1
echo " $DATA - FINAL - USUÁRIOS" >> $LOG;
echo "|--------------------------------------------------------------|" >> $LOG
echo " " >> $LOG
echo " " >> $LOG
}
#######################################################################################  9 - ATUALIZAÇÕES
ATUALIZA(){
echo " " >> $LOG
echo " " >> $LOG
echo "|--------------------------------------------------------------|" >> $LOG
echo " $DATA - INICIO - ATUALIZAÇÕES" >> $LOG;
sudo apt-get update
sudo apt-get full-upgrade
whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "ATUALIZAÇÃO COMPLETA!"  --fb 0 0 0
echo " $DATA - FINAL - ATUALIZAÇÕES " >> $LOG;
echo "|--------------------------------------------------------------|" >> $LOG
echo " " >> $LOG
echo " " >> $LOG
}
#######################################################################################  10 - IP'S
IP(){


interfaces_file="/etc/network/interfaces" 

menuIP=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --menu "Selecione uma opção!" --fb 0 0 0 \
"1" "DHCP" \
"2" "STATICO" \
"3" "Exit" 3>&1 1>&2 2>&3) 
 
status=$?

if [ $status != 0 ]; then
	MAIN_MENU
	exit;
fi


while true
do
case $menuIP in
	
	1)
		#DHCP
		echo "auto lo" > $interfaces_file
		echo "iface lo inet loopback" >> $interfaces_file
		echo ""  >> $interfaces_file
		echo "iface enp2s0f0 inet dhcp" >> $interfaces_file
		echo "allow-hotplug enp2s0f0" >> $interfaces_file
		
		/etc/init.d/networking restart 
		ifconfig enp2s0f0 down
		ifconfig enp2s0f0 up
		whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "DHCP ATIVADO" --fb 0 0 0
		
		kill $$
		;;
		
	2)
		#ENDEREÇO DE IP
		REDEIP=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --inputbox "Digite o endereço IP:" --fb 10 60 3>&1 1>&2 2>&3)
		statussaida=$?
		if [ $statussaida = 0 ]; then
    		echo " IP da Rede: $REDEIP" >> $LOG;
		else
    		echo " Não configurou o endereço IP." >> $LOG; 
		fi


		#MASCARA DE REDE 
		REDENETMASK=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --inputbox "Digite a mascara de rede:" --fb 10 60 3>&1 1>&2 2>&3)
		statussaida=$?
		if [ $statussaida = 0 ]; then
    		echo " Mascara de Rede: $REDENETMASK" >> $LOG; 
		else
    		echo " Não configurou a máscara da interface de rede." >> $LOG;
		fi

		#GATEWAY
		REDEGATEWAY=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --inputbox "Digite o gateway:" --fb 10 60 3>&1 1>&2 2>&3)
		statussaida=$?
		if [ $statussaida = 0 ]; then
    		echo " IP Gateway: $REDEGATEWAY" >> $LOG;
		else
    		echo " Não configurou gateway." >> $LOG;
		fi
		
		#BROADCAST
		REDEBROAD=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --inputbox "Digite o broadcast:" --fb 10 60 3>&1 1>&2 2>&3)
		statussaida=$?
		if [ $statussaida = 0 ]; then
    		echo " IP BROADCAST: $REDEBROAD" >> $LOG;
		else
    		echo " Não configurou broadcast." >> $LOG;
		fi
	
		
		ifconfig enp2s0f0 $REDEIP/24 netmask $REDENETMASK
		route add default gw $REDEGATEWAY enp2s0f0
		etc/init.d/networking restart
		whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "IP ESÁTICO ADICIONADO" --fb 0 0 0
		
		kill $$
		;;
		3) 

		MAIN_MENU
		kill $$
	;;
esac
done

	
echo -e "nameserver 8.8.8.8
nameserver 8.8.4.4" > /etc/resolv.conf;
echo " $DATA DNS adicionado." >> $LOG;
whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "DNS ADICIONADO" --fb 0 0 0

}
#######################################################################################  11 - REMOVE
REMOVE(){
echo " " >> $LOG
echo " " >> $LOG
echo "|--------------------------------------------------------------|" >> $LOG
echo " $DATA - INICIO - REMOÇÃO BÁSICAS" >> $LOG;
sudo aptitude remove kate
sudo aptitude remove kmail
sudo aptitude remove kontact
sudo aptitude remove korganizer
sudo aptitude remove ktnef
sudo aptitude remove gwenview
sudo aptitude remove skanlite 
sudo aptitude remove akregator
sudo aptitude remove konversation
sudo aptitude remove krdc
sudo aptitude remove ktorrent
sudo aptitude remove amarok
sudo aptitude remove k3b
sudo aptitude remove kwalletmanager
sudo aptitude remove plasma-discover 
sudo aptitude remove kleopatra
sudo aptitude remove knotes
echo " $DATA - FINAL - REMOÇÃO BÁSICAS " >> $LOG;
echo "|--------------------------------------------------------------|" >> $LOG
echo " " >> $LOG
echo " " >> $LOG
}
#######################################################################################  12 - ABOUNT
ABOUT (){
clear
whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "
	
	
" --fb 0 0 0
}

#######################################################################################  13 - END_MSG
END_MSG (){
clear

whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "

"  --fb 0 0 0

}

#######################################################################################  DESENVOLVENDO
COMING_SOON(){
clear

whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "
Script em desenvolvimento.
Em caso de dúvida, favor entrar em contato.
$CONTATO

Para solicitar o suporte, favor acessar:
http://chamados.seg.eti.br:3002
"  --fb 0 0 0
}


####################################################################################### Script start

clear

MAIN_MENU

while true
do
case $menu01Option in

	1) 
		#Instalação Completa
		CRIA_DIRETORIO 
		BASICOS # 2
		TEAMVIWER # 3
		WEBMIN # 4
		JAVA # 5
		VSKY#6
		CRONS #7
		USUARIO #8
		ATUALIZA # 9
		IP #10
		REMOVE # 11
		END_MSG
		kill $$
	;;
	2) 
		#Instalação de Programas Baíscos
		CRIA_DIRETORIO
		BASICOS
		MAIN_MENU
		kill $$
	;;
	3) 
		#Instalação TeawViewr
		CRIA_DIRETORIO
		TEAMVIWER
		MAIN_MENU
		kill $$
	;;
	4) 
		#Instalação Webmin
		CRIA_DIRETORIO
		WEBMIN
		MAIN_MENU
		kill $$
	;;
	5) 
		#Instalação Java Oracle
		CRIA_DIRETORIO
		JAVA
		MAIN_MENU
		kill $$
	;;
	6) 
		#Download Vsky
		CRIA_DIRETORIO
		VSKY
		MAIN_MENU
		kill $$
	;;
	7)
		#Cria Crons e Scripts
		CRIA_DIRETORIO
		CRONS
		MAIN_MENU
		kill $$
	;;
	8)
		#Importa Usuário
		CRIA_DIRETORIO
		USUARIO
		MAIN_MENU
		kill $$
	;;
	9) 
		#Atualizações
		ATUALIZA
		MAIN_MENU
		kill $$
	;;
	10) 
		#IP
		IP
		MAIN_MENU
		kill $$
	;;
	11) 
		#Remover Programas Desnecessários
		REMOVE
		MAIN_MENU
		kill $$
	;;
	12) 
		#About
		ABOUT
		MAIN_MENU
		kill $$
	;;
	13) 
		#Exit
		END_MSG
		kill $$
	;;
esac
done