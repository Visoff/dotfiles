function apply_colors {
	envsubst "$color_list" < $1 > $1.tmp && mv $1.tmp $1
}

export -f apply_colors
