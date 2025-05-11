rm -rf ./dist
cp -r ./cfg ./dist

apply_colors ./dist/colors.rasi

sudo rm -rf ~/.config/rofi
sudo cp -r ./dist ~/.config/rofi

rm -rf ./dist
