#!/bin/bash

source requisitos/0.sh

Title
echo " [3] Desencriptar un Handshakes/Hash (Wifi)"
echo
echo " =============================="
echo " 1º Desencriptar un Handshake"" |"
echo " ------------------------------"
echo " 2º Desencriptar un Hash""      |"
echo " ------------------------------"
echo " 3º Volver al Menu""            |"
echo " =============================="
echo
echo
read -p " [*] Elige una opcion: " opc1
	case $opc1 in
			1 ) echo
				echo " ==========================="
				echo " 1º Mediante Fuerza Bruta""  |"
				echo " ---------------------------"
				echo " 2º Mediante un Diccionario""|"
				echo " ==========================="
				echo
				read -p " [*] Elige un metodo: " opc2
					case $opc2 in
							1 ) echo
								read -p " [*] Pon la ruta del Handshake (/home/Descktop/handshake_TPLINKE3B.cap): " hand
								echo
								echo "======================================================================================="
								echo
								primera=`echo $dicc | head -c 1`
								segunda=`echo $hand | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich1=`echo $dicc | cut -c 2- | rev | cut -c2- | rev`
								fi
								if [ $segunda = $coma ]
									then
										fich2=`echo $hand | cut -c 2- | rev | cut -c2- | rev`
								fi
								sudo john $fich2
								echo
								clear
								echo "------------------------------------------"
								echo "↓ Resultados-->"  `sudo aircrack-ng -J resultados/temp1 $fich2 | awk 'NF==6{print $3}'`" ↓"
								echo "------------------------------------------"
								echo
								sudo aircrack-ng -J resultados/temp1 $fich2 | awk 'FNR>= 5{print}' | awk 'FNR<= 3{print}'
								sudo aircrack-ng -J resultados/temp1 $fich2 | awk 'FNR>= 20{print}' 
								echo
								echo "CONTRASEÑA: " `cat resultados/password.handshake.txt`
								echo
								echo "======================================================================================="
								echo
								;;
							2 ) echo
								read -p " [*] Pon la ruta del Handshake (/home/Descktop/handshake_TPLINKE3B.cap): " hand
								read -p " [*] Pon la ruta del Diccionario: " dicc
								echo
								echo "======================================================================================="
								echo
								primera=`echo $dicc | head -c 1`
								segunda=`echo $hand | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich1=`echo $dicc | cut -c 2- | rev | cut -c2- | rev`
								fi
								if [ $segunda = $coma ]
									then
										fich2=`echo $hand | cut -c 2- | rev | cut -c2- | rev`
								fi
								sudo aircrack-ng -w $fich1 $fich2 -l resultados/password.handshake.txt
								echo
								clear
								echo "------------------------------------------"
								echo "↓ Resultados-->"  `sudo aircrack-ng -J resultados/temp1 $fich2 | awk 'NF==6{print $3}'`" ↓"
								echo "------------------------------------------"
								echo
								sudo aircrack-ng -J resultados/temp1 $fich2 | awk 'FNR>= 5{print}' | awk 'FNR<= 3{print}'
								sudo aircrack-ng -J resultados/temp1 $fich2 | awk 'FNR>= 20{print}' 
								echo
								echo "CONTRASEÑA: " `cat resultados/password.handshake.txt`
								echo
								echo "======================================================================================="
								echo
								;;
							* )	echo
								echo "$RRPLY No es una opcion valida"
					esac				
                ;;
            2 ) echo
				echo " ==========================="
				echo " 1º Mediante Fuerza Bruta""  |"
				echo " ---------------------------"
				echo " 2º Mediante un Diccionario""|"
				echo " ==========================="
				echo
				read -p " [*] Elige un metodo: " opc3
					case $opc3 in
							1 ) echo
								read -p " [*] Pon la ruta del Hash (/home/Descktop/miHash): " hash
								echo
								echo "======================================================================================="
								echo
								primera=`echo $dicc | head -c 1`
								segunda=`echo $hash | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich1=`echo $dicc | cut -c 2- | rev | cut -c2- | rev`
								fi
								if [ $segunda = $coma ]
									then
										fich2=`echo $hash | cut -c 2- | rev | cut -c2- | rev`
								fi
								sudo john $fich2 
								echo
								clear
								echo "---------------------------------------------------"
								echo "↓ La Contraseña se mostrará así-->  :contraseña   ↓"
								echo "---------------------------------------------------"
								echo
								echo "CONTRASEÑA: " `john --show=$fich2`
								echo
								echo "======================================================================================="
								echo
								;;
							2 ) echo
								read -p " [*] Pon la ruta del Hash (/home/Descktop/miHash): " hash
								read -p " [*] Pon la ruta del Diccionario: " dicc
								echo
								echo "======================================================================================="
								echo
								primera=`echo $dicc | head -c 1`
								segunda=`echo $hash | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich1=`echo $dicc | cut -c 2- | rev | cut -c2- | rev`
								fi
								if [ $segunda = $coma ]
									then
										fich2=`echo $hash | cut -c 2- | rev | cut -c2- | rev`
								fi
								sudo john --wordlist=$fich1 $fich2 
								echo
								clear
								echo "---------------------------------------------------"
								echo "↓ La Contraseña se mostrará así-->  :contraseña   ↓"
								echo "---------------------------------------------------"
								echo
								echo "CONTRASEÑA: " `john --show=$fich2`
								echo
								echo "======================================================================================="
								echo
								;;
							* )	echo
								echo "$RRPLY No es una opcion valida"
					esac				
                ;;
            3 )	bash the_cracker.sh
				;;
			* )	echo
				echo "$RRPLY No es una opcion valida"
				sleep 3
				bash /requisitos/3.sh
	esac
echo
echo " ==================="
echo " 1-Volver al Menu"
echo " 2-Volver a ejecutar"
echo " 3-Salir"
echo " ==================="
echo
read -p " [*] Elige una opcion: " opc4
	case $opc4 in
			1 )	bash the_cracker.sh
				;;
			2 )	bash requisitos/3.sh
				;;
			3 )	exit && clear
				;;
			* )	echo
				echo "$RRPLY No es una opcion valida"
	esac
