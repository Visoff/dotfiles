export rosewater=#f2d5cf
export flamingo=#eebebe
export pink=#f4b8e4
export mauve=#ca9ee6
export red=#e78284
export maroon=#ea999c
export peach=#ef9f76
export yellow=#e5c890
export green=#a6d189
export teal=#81c8be
export sky=#99d1db
export sapphire=#85c1dc
export blue=#8caaee
export lavender=#babbf1
export text=#c6d0f5
export subtext1=#b5bfe2
export subtext0=#a5adce
export overlay2=#949cbb
export overlay1=#838ba7
export overlay0=#737994
export surface2=#626880
export surface1=#51576d
export surface0=#414559
export base=#303446
export mantle=#292c3c
export crust=#232634

color_list_arr=("rosewater", "flamingo", "pink", "mauve", "red", "maroon", "peach", "yellow", "green", "teal", "sky", "sapphire", "blue", "lavender", "text", "subtext1", "subtext0", "overlay2", "overlay1", "overlay0", "surface2", "surface1", "surface0", "base", "mantle", "crust")
prefixed_list=()
for color in ${color_list_arr[@]}; do
	prefixed_list+=("\$$color")
done
export color_list="${prefixed_list[@]}"
