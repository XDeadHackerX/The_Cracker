#!/bin/bash

function Title {
	clear
	echo
	echo "         TTTTTTT hh                      CCCCC                        kk                   "
	echo "           TTT   hh        eee          CC    C rr rr    aa aa   cccc kk  kk   eee  rr rr  "
	echo "           TTT   hhhhhh  ee   e         CC      rrr  r  aa aaa cc     kkkkk  ee   e rrr  r "
	echo "           TTT   hh   hh eeeee          CC    C rr     aa  aaa cc     kk kk  eeeee  rr     "
	echo "           TTT   hh   hh  eeeee _______  CCCCC  rr      aaa aa  ccccc kk  kk  eeeee rr     "
	echo "                            凸 ( ಠ ͜ʖ ಠ )凸"
	echo "                         __________________________________________________"					
	echo "                          ︻デ═一  Created by: XDeadHackerX v1.1  ︻デ═一 " 
	echo "      -------------------------------------------------------------------------------------------"
	echo "      Cualquier acción y o actividad relacionada con 𝕋𝕙𝕖_ℂ𝕣𝕒𝕔𝕜𝕖𝕣 es únicamente su responsabilidad"
	echo "      -------------------------------------------------------------------------------------------"
	echo
	echo
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	Title
	echo " [0] Instalando requisitos"
	echo
	if ! [ -d requisitos ]
		then
			mkdir requisitos
	fi

	if ! [ -d requisitos/resultados ]
		then
			mkdir requisitos/resultados
	fi
	echo
	sudo apt-get install curl -y
	sudo apt-get install crunch -y
	sudo apt-get install hash-identifier -y
	sudo apt-get install john -y
	sudo apt-get install hydra -y
	sudo apt-get install aircrack -y
	sudo apt-get install gnome-terminal -y
	sudo apt-get install aircrack-ng -y
	sudo apt-get install python3 -y
	sudo apt install git -y

	if ! [ -d requisitos/cupp ]
		then
			cd requisitos
			sudo git clone https://github.com/Mebus/cupp.git 
			cd ..
		else
			cd requisitos
			rm -r cupp
			sudo git clone https://github.com/Mebus/cupp.git 
			cd ..
	fi

	sudo chmod 777 the_cracker.sh
	sudo bash the_cracker.sh
fi
