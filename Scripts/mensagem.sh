#!/bin/bash                                                                                                                                                           
                                                                                                                                                                      
export DISPLAY=:0
export QT_PLUGIN_PATH=/usr/lib/plugins:/usr/lib/qt5/plugins:/usr/lib/qt5/plugins:/lib/kde5/plugins/
export KDE_FULL_SESSION=true

# Fix warning
r="0"
export XDG_RUNTIME_DIR=/run/user/1000                                                                                                                                                 
                                                                                                                                                                      
kdialog --icon 'emblem-information' --title "Em caso de travamento do VSkyDesktop" --passivepopup \ "
<strong>SIGAS A OPÇÕES ABAIXO:\n\n </strong>

- Aperte o <strong><a style="color:#FF0000">X</a></strong> na barra de tarefas abaixo.\n
- Aperte as teclas <strong><a style="color:#FF0000">Ctlr+F4</a></strong> no teclado.
- Caso as opções acima não funcionem lige no Ramal 3260.<br />

<img src='/home/rafaelnetto/Downloads/logo_welcome.png' height='58' width='150'>
" 5      