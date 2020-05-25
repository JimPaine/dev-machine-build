apt-get update; apt-get -y install zsh wget curl git vim sed 
chsh -s $(which zsh)
wget https://github.com/microsoft/cascadia-code/releases/download/v1911.21/CascadiaMonoPL.ttf
mkdir -p ~/local/share/fonts 
mv CascadiaMonoPL.ttf ~/local/share/fonts/CascadiaMonoPL.ttf 
wget https://github.com/microsoft/cascadia-code/releases/download/v1911.21/CascadiaPL.ttf 
mkdir -p ~/local/share/fonts 
mv CascadiaPL.ttf ~/local/share/fonts/CascadiaPL.ttf
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
apt-get autoremove -y ; apt-get clean -y ; rm -rf /var/lib/apt/lists/*

exit