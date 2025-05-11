rm -rf ./dist
cp -r ./cfg ./dist

apply_colors ./dist/colors.css

sudo rm -rf ~/.config/waybar
sudo cp -r ./dist ~/.config/waybar

rm -rf ./dist
