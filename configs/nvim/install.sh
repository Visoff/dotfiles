rm -rf ./dist
cp -r ./cfg ./dist

#apply_colors ./dist/

sudo rm -rf ~/.config/nvim
sudo cp -r ./dist ~/.config/nvim

rm -rf ./dist
