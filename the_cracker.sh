#!/bin/bash

source requisitos/0.sh

Title
echo "	           [#] Elige una de las siguientes opciones: "
echo "	           ------------------------------------------------------------"
echo "	           [0]  Instalar Requisitos"
echo "	           [1]  Desencriptar un Fichero (office .rar .zip .pdf) "
echo "	           [2]  Desencriptar un Protocolo Online (ftp, ssh, telnet...) "
echo "	           [3]  Desencriptar un Handshakes/Hash (Wifi) "
echo "	           [4]  Desencriptar el Login de una IP Local (192.168.1.1:80) "
echo "	           [5]  Crear diccionarios Personalizado"
echo "	           [6]  Utilidades"          
echo "	           [99] ☢Salir☢ "
echo "	           -------------------------------------------------------------"
echo
read -p " [*] Elige una opcion: " opc
	case $opc in
			0 )	bash requisitos/0.sh
				;;
			1 )	bash requisitos/1.sh
				;;
			2 )	bash requisitos/2.sh
				;;
			3 )	bash requisitos/3.sh
				;;
			4 )	bash requisitos/4.sh
				;;
			5 )	bash requisitos/5.sh
				;;
			6 )	echo
				echo " ============================================="
				echo " 1º Ver como seria el Hash de una Contraseña"" |"
				echo " ---------------------------------------------"
				echo " 2º Identificar un Hash""                      |"
				echo " ---------------------------------------------"
				echo " 3º Volver al Menu""                           |"
				echo " ============================================="
				echo
				echo
				read -p " [*] Elige una opcion: " opc1
					case $opc1 in
							1 ) echo
								read -p "[*] Escribe la contraseña que quieres convertir en hash: " pass
								echo
								sudo curl cli.fyi/hash/$pass
								;;
							2 ) echo
								read -p "[*] Escribe o pega el Hash que quieres escanear: " hash
								echo
								sudo hash-identifier $hash
								;;
							3 ) bash the_cracker.sh
								;;
							* )	echo
								echo "$RRPLY No es una opcion valida"
								sleep 3
								bash the_cracker.sh
					esac
				echo
				echo
				echo " ==================="
				echo " 1-Volver al Menu"
				echo " 2-Volver a ejecutar"
				echo " 3-Salir"
				echo " ==================="
				echo
				read -p " [*] Elige una opcion: " opc2
					case $opc2 in
							1 )	bash the_cracker.sh
								;;
							2 )	bash the_cracker.sh
								;;
							3 )	exit && clear
								;;
							* )	echo
								echo "$RRPLY No es una opcion valida"
					esac
				;;
			99 )exit
				;;
			* )	echo
				echo "$RRPLY No es una opcion valida"
				sleep 3
				bash the_cracker.sh
	esac