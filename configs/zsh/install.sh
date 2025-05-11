sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo cp ./cfg/.zshrc ~
sudo cp -r ./cfg/.zfunc ~
chsh -s $(which zsh)
