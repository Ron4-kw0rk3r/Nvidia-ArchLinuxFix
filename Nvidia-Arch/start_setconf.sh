#!/usr/bin/env bash

#*-* coding:utf-8 *-*



pathed=$(whoami)



function banner() {

	sleep 0.4 && echo 'text in here |||||||||||||||||||||||||||||||||||||||||||||||||| '
	sleep 0.4 && echo 'text in here ||-----------INSTALLER-NVIDIA-OLD-TARGETS--FIX--|| '
	sleep 0.4 && echo 'text in here |||||||||||||||||||||||||||||||||||||||||||||||||| '
	
}



function installer() {
	banner
	if  [ -a /usr/bin/pacman ]; then
		
		sleep 0.5 && echo -e "\033[1;32;44m [-] check status user \033[0m" && sleep  0.5 
		if [ "$pathed" == "$USER"  ]; then
			sleep 0.5 && echo -e "\033[1;32;44m [*] check user drivers \033[0m" 
			echo 'compilling...'
			local verify=$(inxi -G | grep "NVIDIA"	| cut -d ':' -f2  | awk '{ print $1 }' |  head -n 1 )
			if [ $verify == "NVIDIA"  ]; then
				
				sleep 0.6 && echo -e '\033[1;32m NVIDIA installing ... \e[0m' 
				echo -n 'model ---> ' && lspci | grep "NVIDIA" | awk  '{print $7}' | head -n 1
				echo -b 'target -->' && lspci | grep "NVIDIA" | awk '{print $8 $9 $10}' | head -n 1
				yay -S nvidia-470xx-dkms nvidia-470xx-utils  nvidia-470xx-settings lib32-opencl-nvidia-470xx lib32-nvidia-470xx-utils
				echo 'please script build nvidia in boot'
				if [ -d /boot/grub ]; then
 					sudo grub-mkconfig -o /boot/grub/grub.cfg 
				
 				else
 					echo 'attemp in btfrs ...'
 					if -d [ -d /@boot/grub/grub.cfg ]; then
 						sudo grub-mkconfig -o @boot/grub/grub.cfg
 					fi					
			else
				echo "error"
				exit
				
				#exit
			fi
			#sudo pacman -Syy 
			# sudo pacman -S nvidia-470xx-dkms lib32-nvidia 
			# exit
		else
			sleep 0.5 && echo -e "\033[1;32;44m [-] please run script user root  \033[0m" 
			exit
		fi
	fi
			
	# echo "$pathed"
	
}
	

installer

