#/usr/bin/bash

function yay {
	cd /home/$USER/Downloads/
	git clone https://aur.archlinux.org/yay.git
	cd yay/
	makepkg -si
}

sudo pacman -S feh alacritty zsh i3 i3-gaps git vim neofetch arandr xorg-xrandr picom pulseaudio pavucontrol xorg-xinit rofi firefox wget unzip ranger mpv

mkdir /home/$USER/Desktop/ /home/$USER/Downloads/ /home/$USER/Documents/ /home/$USER/Pictures/ /home/$USER/.config/ /home/$USER/Scripts

echo -n "Enter your git username: " && read gitUsername
echo -n "Enter your git email: " && read gitEmail
git config --global user.name $gitUsername
git config --global user.email $gitEmail

echo -n "Enter your current linux username: " && read USER

if [ ! $USER ]
then
    echo "Couldn't find any input..."
    sleep 3
    clear
    exit
else
    sudo mkdir ~/.config/i3
    sudo cp ./i3/config /home/$USER/.config/i3/
    sudo cp ./i3/i3status.conf /etc/

    sudo cp ./vim/vimrc /etc/

    sudo cp ./picom/picom.conf /etc/xdg

    cp ./shell/.bashrc /home/$USER/

    cp -r ./alacritty/ /home/$USER/.config/
    cp ./Backgrounds/.fehbg /home/$USER/

    cp -r ./.fonts/ ~

    cp -r ./Backgrounds/ /home/$USER/Pictures/
    mv /home/$USER/Pictures/Backgrounds/.fehbg ~/.config/
fi

echo "Installing yay (AUR helper)..."
yay()
clear

yay -S visual-studio-code-aur
yay -S google-chrome
yay -S spotify
yay -S discord

echo "ALL DONE! press q to exit...\n"
read -n 1 quit <&1
if [ $quit == "q" ]
then
	reset
	exit
fi
