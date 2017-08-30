#!/bin/bash

export DISPLAY=:0
export QT_PLUGIN_PATH=/usr/lib/plugins:/usr/lib/qt5/plugins:/usr/lib/qt5/plugins:/lib/kde5/plugins/
export KDE_FULL_SESSION=true

# Fix warning
export XDG_RUNTIME_DIR=/run/user/1000

# Main Program

	kdialog --title "Programa de Regulação" --warningyesno "O VSky acabou de travar?"

	if [[ $? -ne 1 ]]; then
		logger -t $0 -p local0.warning -- "Vsky Fechado" &&ps aux | grep java |awk '{print "kill -9 "$2}'|sh
		kdialog --textbox "Programa de Regulação" --msgbox "VSkyDesktop será Reiniciado! \nObrigado"
		logger -t $0 -p local0.warning -- "VSKY Iniciado" &&/usr/bin/java -jar /etc/Suporte/VSkyDesktop.jar
	else
		kdialog --title "ABOUNT" --msgbox "Copyright: \n- SEG Tecnologia - BARBACENA \n\nDuvidas e Suporte: \nRamal: 3259 - Rafael \nRamal: 3260 - Fred \n\nObrigado!"
	fi
