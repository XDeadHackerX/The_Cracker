#!/bin/bash

source requisitos/0.sh

Title
echo " [5] Crear diccionarios Personalizado"
echo
echo " ================================================="
echo " 1º Diccionario personalizado a una Persona ""     |"
echo " -------------------------------------------------"
echo " 2º Diccionario que combina Numero""               |"
echo " -------------------------------------------------"
echo " 3º Diccionario que combina Letras""               |"
echo " -------------------------------------------------"
echo " 4º Diccionario que combina el Abecedario entero"" |"
echo " -------------------------------------------------"
echo " 5º Diccionario que combina Palabras""             |"
echo " -------------------------------------------------"
echo " 6º Volver al Menu""                               |"
echo " ================================================="
echo
echo
read -p " [*] Elige una opcion: " opc1
	case $opc1 in
			1 ) echo
				read -p " [*] Escribe el nombre (Posteriormente volvera a preguntarlo, escribelo igual en ambos sitios): " name
				read -p " [*] Rellena del siguiente formulario las preguntas que sepas (Enter): " enter
				echo
				var=$(echo "$name" | perl -ne 'print lc')
				cd requisitos/cupp
				sudo python3 cupp.py -i
				cd ..
				cd ..
				find requisitos/cupp -type f -name "*.txt" -exec mv -t requisitos/resultados {} +
				b=$(cat "requisitos/resultados/$var.txt" | wc -c)
				Title
				echo " [*] Informacion sobre su Diccionario"
				echo
				echo " ========================================================"
				echo " * Nombre: $var.txt"
				echo " * Ruta: The_Cracker/requisitos/resultados/$var.txt"
				echo " * Numero de lineas: $(cat "requisitos/resultados/$var.txt" | wc -l)"
				echo " * Peso del Archivo: $(echo "scale=2; $b/1024/1024" | bc -l) Mb  /  $b Byte"
				echo " ========================================================"
				;;
			2 ) echo
				read -p " [*] Escribe el nombre del Diccionario (Ej: Dicc_TpLink): " name
				read -p " [*] Escribe el numero de Caracteres por el que empieza el Diccionario (Ej: 8): " start
				read -p " [*] Escribe el numero total de Caracteres (Ej: 8): " end
				read -p " [*] Escribe la Secuencia de numeros (Ej:0123456789): " secuencia
				echo
				sudo crunch $start $end $secuencia -o requisitos/resultados/$name.txt
				b=`cat requisitos/resultados/$name.txt | wc -c`
				Title
				echo " [*] Informacion sobre su Diccionario"
				echo
				echo " ========================================================"
				echo " * Nombre: $name.txt"
				echo " * Ruta: The_Cracker/requisitos/resultados/$name.txt"
				echo " * Numero de lineas: `cat requisitos/resultados/$name.txt | wc -l`"
				echo " * Peso del Archivo: `echo "scale=2; $b/1024/1024" | bc -l` Mb  /  $b Byte"
				echo " ========================================================"
				;;
			3 ) echo
				read -p "[*] Escribe el nombre del Diccionario (Ej: Dicc_Vocales): " name
				read -p "[*] Escribe el numero de Caracteres por el que empieza el Diccionario (Ej: 1): " start
				read -p "[*] Escribe el numero total de Caracteres (Ej: 5): " end
				read -p "[*] Escribe la Secuencia de letras (Ej:aeiou): " secuencia
				echo
				sudo crunch $start $end $secuencia -o requisitos/resultados/$name.txt
				b=`cat requisitos/resultados/$name.txt | wc -c`
				Title
				echo " [*] Informacion sobre su Diccionario"
				echo
				echo " ========================================================"
				echo " * Nombre: $name.txt"
				echo " * Ruta: The_Cracker/requisitos/resultados/$name.txt"
				echo " * Numero de lineas: `cat requisitos/resultados/$name.txt | wc -l`"
				echo " * Peso del Archivo: `echo "scale=2; $b/1024/1024" | bc -l` Mb  /  $b Byte"
				echo " ========================================================"
				;;
			4 ) echo
				read -p " [*] Escribe el nombre del Diccionario (Ej: Dicc_Abecedario): " name
				read -p " [*] Escribe el numero de Caracteres por el que empieza el Diccionario (Ej: 1): " start
				read -p " [*] Escribe el numero total de Caracteres (Ej: 6): " end
				echo
				sudo crunch $start $end -o requisitos/resultados/$name.txt
				b=`cat requisitos/resultados/$name.txt | wc -c`
				Title
				echo " [*] Informacion sobre su Diccionario"
				echo
				echo " ========================================================"
				echo " * Nombre: $name.txt"
				echo " * Ruta: The_Cracker/requisitos/resultados/$name.txt"
				echo " * Numero de lineas: `cat requisitos/resultados/$name.txt | wc -l`"
				echo " * Peso del Archivo: `echo "scale=2; $b/1024/1024" | bc -l` Mb  /  $b Byte"
				echo " ========================================================"
				;;
			5 ) echo
				read -p " [*] Escribe el nombre del Diccionario (Ej: Dicc_Palabras): " name
				read -p " [*] Escribe las palabras separadas entre ellas con un espacio (Ej:perro gato pajaro): " secuencia
				echo
				sudo crunch 1 2 $secuencia > requisitos/resultados/$name.txt
				b=`cat requisitos/resultados/$name.txt | wc -c`
				Title
				echo " [*] Informacion sobre su Diccionario"
				echo
				echo " ========================================================"
				echo " * Nombre: $name.txt"
				echo " * Ruta: The_Cracker/requisitos/resultados/$name.txt"
				echo " * Numero de lineas: `cat requisitos/resultados/$name.txt | wc -l`"
				echo " * Peso del Archivo: `echo "scale=2; $b/1024/1024" | bc -l` Mb  /  $b Byte"
				echo " ========================================================"
				;;
			6 ) bash the_cracker.sh
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
			2 )	bash requisitos/5.sh
				;;
			3 )	exit && clear
				;;
			* )	echo
				echo "$RRPLY No es una opcion valida"
	esac