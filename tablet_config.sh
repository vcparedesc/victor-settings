#! /bin/bash  
# Setup HUION Q11 v2, after bridged to wacom driver with Digimend Kernel module.  
# License: CC-0/Public-Domain license  
# author: deevad  

# Tablet definition  
tabletstylus="HUION Huion Tablet_H640P stylus"  
tabletpad="HUION Huion Tablet_H640P Pad pad"  

# Reset  
xsetwacom --set "$tabletstylus" ResetArea  
xsetwacom --set "$tabletstylus" RawSample 4  

# Mapping  
# get maximum size geometry with:  
# xsetwacom --get "$tabletstylus" Area  
# 0 0 55880 34925  
tabletX=32000  
tabletY=20000  
# screen size:  
screenX=1920  
screenY=1080  
# map to good screen (second screen, starts at HEAD-0)  
 xsetwacom --set "$tabletstylus" MapToOutput "HEAD-1"  
# setup ratio :  
# newtabletY=$(( $screenY * $tabletX / $screenX ))  
# xsetwacom --set "$tabletstylus" Area 0 0 "$tabletX" "$newtabletY"




# Buttons  
# =======  
xsetwacom --set "$tabletstylus" Button 2 2
xsetwacom --set "$tabletstylus" Button 3 3  
# # ---------  
# # | 12 |
# # | -- |
# # | 11 |
# # | -- |
# # | 10 |
# # | -- |
# # |  9 |
# # |=======|  
# # |  8 |
# # | -- |
# # |  3 |
# # | -- |
# # |  2 |
# # | -- |
# # |  1 |
# # |=======| 

xsetwacom --set "$tabletpad" Button 10 "key +ctrl r" # Selection tool
xsetwacom --set "$tabletpad" Button 9 "key t" # Transform tool
xsetwacom --set "$tabletpad" Button 8 "key b"  # Brush
xsetwacom --set "$tabletpad" Button 3 "key Shift_L" # Resize brush
xsetwacom --set "$tabletpad" Button 2 "key m" # Mirror 
xsetwacom --set "$tabletpad" Button 1 "key +ctrl z" # Undo 


# # Xinput option  
# # =============  
# # for the list:  
# # xinput --list  zz

# # xinput list-props 'HUION Huion Tablet Pen Mouse' 
# xinput list-props 'HUION Huion Tablet Touch Strip pad' "Evdev Middle Button Emulation" 0 
# # xinput set-prop 'HUION Huion Tablet Pen' "Evdev Middle Button Emulation" 0  
# # alternate way to map to a single screen  
# # execute "xrander" in a terminal to get the screen name ( DVI-D-0 in this example )  
# # xinput set-prop 'HUION' DVI-D-0
