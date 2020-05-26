## Install ntpd
apt install ntp -y
sed -i 's/ubuntu.pool.ntp.org/europe.pool.ntp.org/g' /etc/ntp.conf
service ntp restart

## Install ZSH
apt update; apt -y install zsh wget curl git vim sed 
chsh -s $(which zsh)
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
sed -i 's/prompt_segment black default "%(!.%{%F{yellow}%}.)%n@%m"/prompt_segment black default "%(!.%{%F{yellow}%}.)%n"/g' ~/.oh-my-zsh/themes/agnoster.zsh-theme

## Install Cascadia fonts
wget https://github.com/microsoft/cascadia-code/releases/download/v1911.21/CascadiaMonoPL.ttf
mkdir -p ~/local/share/fonts 
mv CascadiaMonoPL.ttf ~/local/share/fonts/CascadiaMonoPL.ttf 
wget https://github.com/microsoft/cascadia-code/releases/download/v1911.21/CascadiaPL.ttf 
mkdir -p ~/local/share/fonts 
mv CascadiaPL.ttf ~/local/share/fonts/CascadiaPL.ttf
sed -i 's/FONTFACE="Fixed"/FONTFACE="Cascadia Mono PL"/g' /etc/default/console-setup

## Install OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
apt autoremove -y ; apt clean -y ; rm -rf /var/lib/apt/lists/*

## Install Azure Cli
apt install ca-certificates curl apt-transport-https lsb-release gnupg
curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    tee /etc/apt/sources.list.d/azure-cli.list

apt update
apt install azure-cli -y

## Install .NET Core
distroVersion=$(lsb_release -rs)
wget https://packages.microsoft.com/config/ubuntu/$distroVersion/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb

apt update
apt install apt-transport-https -y
apt update
apt install dotnet-sdk-3.1 -y

## Install kubectl
apt update && sudo apt install -y apt-transport-https gnupg2
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt update
apt install -y kubectl

## Install terraform
apt install unzip
wget https://releases.hashicorp.com/terraform/0.12.25/terraform_0.12.25_linux_amd64.zip
unzip terraform_0.12.25_linux_amd64.zip
mv ./terraform /usr/local/bin/terraform
rm terraform_0.12.25_linux_amd64.zip

## Install func cli
apt update -y
apt install azure-functions-core-tools-3 -y

## Install GitHub cli
wget https://github.com/cli/cli/releases/download/v0.8.0/gh_0.8.0_linux_amd64.deb
apt install ./gh_*_linux_amd64.deb

## Install everything else
apt install git
