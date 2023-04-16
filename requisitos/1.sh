#!/bin/bash

source requisitos/0.sh

Title
echo " [1] Desencriptar un Fichero (office .rar .zip .pdf)"
echo
echo " ==================================="
echo " 1º Desencriptar un .ZIP""           |"
echo " -----------------------------------"
echo " 2º Desencriptar un .RAR""           |"
echo " -----------------------------------"
echo " 3º Desencriptar un .PDF""           |"
echo " -----------------------------------"
echo " 4º Desencriptar un Fichero Office"" |"
echo " -----------------------------------"
echo " 5º Volver al menu""                 |"
echo " ==================================="
echo
echo
read -p " [*] Elige una opcion: " opc1
	case $opc1 in
			1 )	echo
				echo " ==========================="
				echo " 1º Mediante Fuerza Bruta""  |"
				echo " ---------------------------"
				echo " 2º Mediante un Diccionario""|"
				echo " ==========================="
				echo
				read -p " [*] Elige un metodo: " opc2
					case $opc2 in
							1 ) echo
								echo
								read -p " [*] Pon la ruta del .zip: " file
								echo
								echo "======================================================================================="
								echo
								primera=`echo $file | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich=`echo $file | cut -c 2- | rev | cut -c2- | rev`
								fi
								sudo zip2john $fich > requisitos/resultados/hash.txt
								sudo john requisitos/resultados/hash.txt
								echo
								echo "---------------------------------------------------"
								echo "↓ La Contraseña se mostrará así-->  :contraseña:  ↓"
								echo "---------------------------------------------------"
								echo
								sudo john requisitos/resultados/hash.txt --show
								echo
								echo "======================================================================================="
								echo
								;;
							2 )	echo
								read -p " [*] Pon la ruta del .zip: " file
								read -p " [*] Pon la ruta del Diccionario: " dicc
								echo
								echo "======================================================================================="
								echo
								primera=`echo $file | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich=`echo $file | cut -c 2- | rev | cut -c2- | rev`
								fi
								sudo zip2john $fich > requisitos/resultados/hash.txt
								sudo john --wordlist=$dicc requisitos/resultados/hash.txt
								sudo john requisitos/resultados/hash.txt
								echo
								echo "---------------------------------------------------"
								echo "↓ La Contraseña se mostrará así-->  :contraseña:  ↓"
								echo "---------------------------------------------------"
								echo
								sudo john requisitos/resultados/hash.txt --show
								echo
								echo "======================================================================================="
								echo
								;;
							* )	echo
								echo "$RRPLY No es una opcion valida"
					esac
			;;
			2 )	echo
				echo " ==========================="
				echo " 1º Mediante Fuerza Bruta""  |"
				echo " ---------------------------"
				echo " 2º Mediante un Diccionario""|"
				echo " ==========================="
				echo
				read -p " [*] Elige un metodo: " opc3
					case $opc3 in
							1 ) echo
								echo
								read -p " [*] Pon la ruta del .rar: " file
								echo
								echo "======================================================================================="
								echo
								primera=`echo $file | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich=`echo $file | cut -c 2- | rev | cut -c2- | rev`
								fi
								sudo rar2john $fich > requisitos/resultados/hash.txt
								sudo john requisitos/resultados/hash.txt
								echo
								echo "---------------------------------------------------"
								echo "↓ La Contraseña se mostrará así-->  :contraseña:  ↓"
								echo "---------------------------------------------------"
								echo
								sudo john requisitos/resultados/hash.txt --show
								echo
								echo "======================================================================================="
								echo
								;;
							2 )	echo
								read -p " [*] Pon la ruta del .rar: " file
								read -p " [*] Pon la ruta del Diccionario: " dicc
								echo
								echo "======================================================================================="
								echo
								primera=`echo $file | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich=`echo $file | cut -c 2- | rev | cut -c2- | rev`
								fi
								sudo rar2john $fich > requisitos/resultados/hash.txt
								sudo john --wordlist=$dicc requisitos/resultados/hash.txt
								sudo john requisitos/resultados/hash.txt
								echo
								echo "---------------------------------------------------"
								echo "↓ La Contraseña se mostrará así-->  :contraseña:  ↓"
								echo "---------------------------------------------------"
								echo
								sudo john requisitos/resultados/hash.txt --show
								echo
								echo "======================================================================================="
								echo
								;;
							* )	echo
								echo "$RRPLY No es una opcion valida"
					esac
			;;
            3 )	echo
				echo " ==========================="
				echo " 1º Mediante Fuerza Bruta""  |"
				echo " ---------------------------"
				echo " 2º Mediante un Diccionario""|"
				echo " ==========================="
				echo
				read -p " [*] Elige un metodo: " opc4
					case $opc4 in
							1 ) echo
								echo
								read -p " [*] Pon la ruta del .pdf: " file
								echo
								echo "======================================================================================="
								echo
								primera=`echo $file | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich=`echo $file | cut -c 2- | rev | cut -c2- | rev`
								fi
								sudo pdf2john $fich > requisitos/resultados/hash.txt
								sudo john requisitos/resultados/hash.txt
								echo
								echo "---------------------------------------------------"
								echo "↓ La Contraseña se mostrará así-->  :contraseña   ↓"
								echo "---------------------------------------------------"
								echo
								sudo john requisitos/resultados/hash.txt --show
								echo
								echo "======================================================================================="
								echo
								;;
							2 )	echo
								read -p " [*] Pon la ruta del .pdf: " file
								read -p " [*] Pon la ruta del Diccionario: " dicc
								echo
								echo "======================================================================================="
								echo
								primera=`echo $file | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich=`echo $file | cut -c 2- | rev | cut -c2- | rev`
								fi
								sudo pdf2john $fich > requisitos/resultados/hash.txt
								sudo john --wordlist=$dicc requisitos/resultados/hash.txt
								sudo john requisitos/resultados/hash.txt
								echo
								echo "---------------------------------------------------"
								echo "↓ La Contraseña se mostrará así-->  :contraseña   ↓"
								echo "---------------------------------------------------"
								echo
								sudo john requisitos/resultados/hash.txt --show
								echo
								echo "======================================================================================="
								echo
								;;
							* )	echo
								echo "$RRPLY No es una opcion valida"
					esac
			;;
			4 )	echo
				echo " ==========================="
				echo " 1º Mediante Fuerza Bruta""  |"
				echo " ---------------------------"
				echo " 2º Mediante un Diccionario""|"
				echo " ==========================="
				echo
				read -p " [*] Elige un metodo: " opc5
					case $opc5 in
							1 ) echo
								echo
								read -p " [*] Pon la ruta del Fichero: " file
								echo
								echo "======================================================================================="
								echo
								primera=`echo $file | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich=`echo $file | cut -c 2- | rev | cut -c2- | rev`
								fi
								sudo office2john $fich > requisitos/resultados/hash.txt
								sudo john requisitos/resultados/hash.txt
								echo
								echo "---------------------------------------------------"
								echo "↓ La Contraseña se mostrará así-->  :contraseña   ↓"
								echo "---------------------------------------------------"
								echo
								sudo john requisitos/resultados/hash.txt --show
								echo
								echo "======================================================================================="
								echo
								;;
							2 )	echo
								read -p " [*] Pon la ruta del Fichero: " file
								read -p " [*] Pon la ruta del Diccionario: " dicc
								echo
								echo "======================================================================================="
								echo
								primera=`echo $file | head -c 1`
								coma="'"
								if [ $primera = $coma ]
									then
										fich=`echo $file | cut -c 2- | rev | cut -c2- | rev`
								fi
								sudo office2john $fich > requisitos/resultados/hash.txt
								sudo john --wordlist=$dicc requisitos/resultados/hash.txt
								sudo john requisitos/resultados/hash.txt
								echo
								echo "---------------------------------------------------"
								echo "↓ La Contraseña se mostrará así-->  :contraseña   ↓"
								echo "---------------------------------------------------"
								echo
								sudo john requisitos/resultados/hash.txt --show
								echo
								echo "======================================================================================="
								echo
								;;
							* )	echo
								echo "$RRPLY No es una opcion valida"
					esac
			;;
            5 )	bash the_cracker.sh
				;;
			* )	echo
				echo "$RRPLY No es una opcion valida"
				sleep 3
				bash requisitos/1.sh
	esac
echo
echo
echo " ==================="
echo " 1-Volver al Menu"
echo " 2-Volver a ejecutar"
echo " 3-Salir"
echo " ==================="
echo
read -p " [*] Elige una opcion: " opc6
	case $opc6 in
			1 )	bash the_cracker.sh
				;;
			2 )	bash requisitos/1.sh
				;;
			3 )	exit && clear
				;;
			* )	echo
				echo "$RRPLY No es una opcion valida"
	esac