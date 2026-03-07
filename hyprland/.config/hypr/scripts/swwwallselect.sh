#!/usr/bin/env sh

# set variables
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/globalcontrol.sh
RofiConf="${XDG_CONFIG_HOME:-$HOME/.config}/rofi/themeselect.rasi"

ctlLine=`grep '^1|' "$ThemeCtl"`
if [ `echo $ctlLine | wc -l` -ne "1" ] ; then
    echo "ERROR : $ThemeCtl Unable to fetch theme..."
    exit 1
fi

fullPath=$(echo "$ctlLine" | awk -F '|' '{print $NF}' | sed "s+~+$HOME+")
wallPath=$(dirname "$fullPath")
if [ ! -d "${wallPath}" ] && [ -d "${XDG_CONFIG_HOME:-$HOME/.config}/swww/${gtkTheme}" ] && [ ! -z "${gtkTheme}" ] ; then
    wallPath="${XDG_CONFIG_HOME:-$HOME/.config}/swww/${gtkTheme}"
fi


# scale for monitor x res
x_monres=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
monitor_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')
x_monres=$(( x_monres * 17 / monitor_scale ))


# set rofi override
elem_border=$(( hypr_border * 3 ))
r_override="element{border-radius:${elem_border}px;} listview{columns:6;spacing:100px;} element{padding:0px;orientation:vertical;} element-icon{size:${x_monres}px;border-radius:0px;} element-text{padding:20px;}"


# launch rofi menu
currentWall=`basename "$fullPath"`
wallFiles=$(find "${wallPath}" -type f \( -iname "*.gif" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | sort)
currentIndex=$(printf '%s\n' "${wallFiles}" | awk -v wall="${currentWall}" 'BEGIN{idx=0} {if($0==wall){print idx; found=1; exit} idx++} END{if(!found) print 0}')

RofiIdx=$(printf '%s\n' "${wallFiles}" | while IFS= read -r rfile
do
    title=$(printf '%s\n' "${rfile%.*}" | sed -E 's/[_-]+/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); print}')
    printf '%s\x00icon\x1f%s\n' "$title" "${cacheDir}/${gtkTheme}/${rfile}"
done | rofi -dmenu -format i -theme-str "${r_override}" -config "${RofiConf}" -select "${currentIndex}")


# apply wallpaper
if [ ! -z "${RofiIdx}" ] ; then
    RofiSel=$(printf '%s\n' "${wallFiles}" | awk -v idx="$((RofiIdx + 1))" 'NR==idx{print; exit}')
    "${ScrDir}/swwwallpaper.sh" -s "${wallPath}/${RofiSel}"
    dunstify "t1" -a " ${RofiSel}" -i "${cacheDir}/${gtkTheme}/${RofiSel}" -r 91190 -t 2200
fi
