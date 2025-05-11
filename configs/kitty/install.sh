rm -rf ./dist
cp -r ./cfg ./dist

apply_colors ./dist/current-theme.conf

sudo rm -rf ~/.config/kitty
sudo cp -r ./dist ~/.config/kitty

rm -rf ./dist
