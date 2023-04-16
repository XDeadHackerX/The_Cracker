#!/bin/bash

source requisitos/0.sh

Title
echo " [2] Desencriptar un Protocolo Online (ftp, ssh, telnet...)"
echo
echo " =================================="
echo " 1º Desencriptar Protocolo FTP""    |"
echo " ----------------------------------"
echo " 2º Desencriptar Protocolo SSH""    |"
echo " ----------------------------------"
echo " 3º Desencriptar Protocolo Telnet"" |"
echo " ----------------------------------"
echo " 4º Desencriptar Protocolo SMB""    |"
echo " ----------------------------------"
echo " 5º Desencriptar Protocolo RDP""    |"
echo " ----------------------------------"
echo " 6º Volver al Menu""                |"
echo " =================================="
echo
echo
read -p " [*] Elige una opcion: " opc1
	case $opc1 in
            1 ) echo
                echo " =============================================="
                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                echo " ----------------------------------------------"
                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                echo " =============================================="
                echo
                read -p " [*] Elige una opcion: " opc2
                read -p " [*] Escribe la Direccion o Ip (Ej: ftp.prueba.com / 192.168.1.10): " Ip
                read -p " [*] Escribe el puerto (Ej: 80): " puerto
                if [ $opc2 = 1 ]
                    then
                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                    else
                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " dicc2
                fi
                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " dicc1
                Title
                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                echo
                    case $opc2 in
                            1 )	echo
                                primera=`echo $dicc1 | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich1=`echo $dicc1 | cut -c 2- | rev | cut -c2- | rev`
								fi
                                sudo hydra -l $usr -P $fich1 ftp://$Ip:$puerto -t 4 -f -V -I
                                ;;
                            2 )	echo
                                primera=`echo $dicc1 | head -c 1`
								segunda=`echo $dicc2 | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich1=`echo $dicc2 | cut -c 2- | rev | cut -c2- | rev`
								fi
								if [ $segunda = $coma ]
									then
										fich2=`echo $dicc1 | cut -c 2- | rev | cut -c2- | rev`
								fi
                                sudo hydra -L $fich2 -P $fich1 ftp://$Ip:$puerto -t 4 -f -V -I
                                ;;
                            * )	echo
                                echo "$RRPLY No es una opcion valida"
                    esac
                ;;
            2 ) echo
                echo " =============================================="
                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                echo " ----------------------------------------------"
                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                echo " =============================================="
                echo
                read -p " [*] Elige una opcion: " opc2
                read -p " [*] Escribe la Direccion o Ip (Ej: x.prueba.com / 192.168.1.10): " Ip
                read -p " [*] Escribe el puerto (Ej: 80): " puerto
                if [ $opc2 = 1 ]
                    then
                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                    else
                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " dicc2
                fi
                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " dicc1
                Title
                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                echo
                    case $opc2 in
                            1 )	echo
                                primera=`echo $dicc1 | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich1=`echo $dicc1 | cut -c 2- | rev | cut -c2- | rev`
								fi
                                sudo hydra -l $usr -P $fich1 ssh://$Ip:$puerto -t 4 -f -V -I
                                ;;
                            2 )	echo
                                primera=`echo $dicc1 | head -c 1`
								segunda=`echo $dicc2 | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich1=`echo $dicc2 | cut -c 2- | rev | cut -c2- | rev`
								fi
								if [ $segunda = $coma ]
									then
										fich2=`echo $dicc1 | cut -c 2- | rev | cut -c2- | rev`
								fi
                                sudo hydra -L $fich2 -P $fich1 ssh://$Ip:$puerto -t 4 -f -V -I
                                ;;
                            * )	echo
                                echo "$RRPLY No es una opcion valida"
                    esac
                ;;
            3 ) echo
                echo " =============================================="
                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                echo " ----------------------------------------------"
                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                echo " =============================================="
                echo
                read -p " [*] Elige una opcion: " opc2
                read -p " [*] Escribe la Direccion o Ip (Ej: x.prueba.com / 192.168.1.10): " Ip
                read -p " [*] Escribe el puerto (Ej: 80): " puerto
                if [ $opc2 = 1 ]
                    then
                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                    else
                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " dicc2
                fi
                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " dicc1
                Title
                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                echo
                    case $opc2 in
                            1 )	echo
                                primera=`echo $dicc1 | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich1=`echo $dicc1 | cut -c 2- | rev | cut -c2- | rev`
								fi
                                sudo hydra -l $usr -P $fich1 telnet://$Ip:$puerto -t 4 -f -V -I
                                ;;
                            2 )	echo
                                primera=`echo $dicc1 | head -c 1`
								segunda=`echo $dicc2 | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich1=`echo $dicc2 | cut -c 2- | rev | cut -c2- | rev`
								fi
								if [ $segunda = $coma ]
									then
										fich2=`echo $dicc1 | cut -c 2- | rev | cut -c2- | rev`
								fi
                                sudo hydra -L $fich2 -P $fich1 telnet://$Ip:$puerto -t 4 -f -V -I
                                ;;
                            * )	echo
                                echo "$RRPLY No es una opcion valida"
                    esac
                ;;
            4 ) echo
                echo " =============================================="
                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                echo " ----------------------------------------------"
                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                echo " =============================================="
                echo
                read -p " [*] Elige una opcion: " opc2
                read -p " [*] Escribe la Direccion o Ip (Ej: x.prueba.com / 192.168.1.10): " Ip
                read -p " [*] Escribe el puerto (Ej: 80): " puerto
                if [ $opc2 = 1 ]
                    then
                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                    else
                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " dicc2
                fi
                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " dicc1
                Title
                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                echo
                    case $opc2 in
                            1 )	echo
                                primera=`echo $dicc1 | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich1=`echo $dicc1 | cut -c 2- | rev | cut -c2- | rev`
								fi
                                sudo hydra -l $usr -P $fich1 smb://$Ip:$puerto -t 4 -f -V -I
                                ;;
                            2 )	echo
                                primera=`echo $dicc1 | head -c 1`
								segunda=`echo $dicc2 | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich1=`echo $dicc2 | cut -c 2- | rev | cut -c2- | rev`
								fi
								if [ $segunda = $coma ]
									then
										fich2=`echo $dicc1 | cut -c 2- | rev | cut -c2- | rev`
								fi
                                sudo hydra -L $fich2 -P $fich1 smb://$Ip:$puerto -t 4 -f -V -I
                                ;;
                            * )	echo
                                echo "$RRPLY No es una opcion valida"
                    esac
                ;;
            5 ) echo
                echo " =============================================="
                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                echo " ----------------------------------------------"
                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                echo " =============================================="
                echo
                read -p " [*] Elige una opcion: " opc2
                read -p " [*] Escribe la Direccion o Ip (Ej: x.prueba.com / 192.168.1.10): " Ip
                read -p " [*] Escribe el puerto (Ej: 80): " puerto
                if [ $opc2 = 1 ]
                    then
                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                    else
                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " dicc2
                fi
                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " dicc1
                Title
                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                echo
                    case $opc2 in
                            1 )	echo
                                primera=`echo $dicc1 | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich1=`echo $dicc1 | cut -c 2- | rev | cut -c2- | rev`
								fi
                                sudo hydra -l $usr -P $fich1 rdp://$Ip:$puerto -t 4 -f -V -I
                                ;;
                            2 )	echo
                                primera=`echo $dicc1 | head -c 1`
								segunda=`echo $dicc2 | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich1=`echo $dicc2 | cut -c 2- | rev | cut -c2- | rev`
								fi
								if [ $segunda = $coma ]
									then
										fich2=`echo $dicc1 | cut -c 2- | rev | cut -c2- | rev`
								fi
                                sudo hydra -L $fich2 -P $fich1 rdp://$Ip:$puerto -t 4 -f -V -I
                                ;;
                            * )	echo
                                echo "$RRPLY No es una opcion valida"
                    esac
                ;;
            6 ) bash the_cracker.sh
                ;;
            * )	echo
				echo "$RRPLY No es una opcion valida"
				sleep 3
				bash requisitos/2.sh
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
			2 )	bash requisitos/2.sh
				;;
			3 )	exit && clear
				;;
			* )	echo
				echo "$RRPLY No es una opcion valida"
	esac
  
