INSTALL_ENABLED=true

for arg in "$@"; do
    case $arg in
        --no-install)
            INSTALL_ENABLED=false
            shift
            ;;
        *)
            ;;
    esac
done


config_all_pkgs=$(fd -td --max-depth=1 . configs)
config_pkgs=()
dependancies=()

for pkg in $config_all_pkgs; do
	read -rp "Include $(basename $pkg)? [Y/n]: " ans
	case "$ans" in 
		[Nn]|[Nn][Oo])
			# do nothing
			;;
		*)
			config_pkgs+=($pkg)
			dependancies+=($(cd "${pkg}" && cat "dependancies.txt"))
		;;
	esac
done

echo "Installing dependancies"
if [ "$INSTALL_ENABLED" = true ]; then
    yay -Sy && yay -Su && yay -S ${dependancies[@]}
else
    echo "Skipping installation"
fi

source ./utils.sh
source ./colorscheme/default.sh
source ./colorscheme/current.sh

echo "Running install scripts"
for pkg in ${config_pkgs[@]}; do
	echo "configuring $(basename $pkg)"
	sh -c "cd \"$pkg\" && ./install.sh"
done
