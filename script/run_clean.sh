#!/bin/bash

function select_option {

    # little helpers for terminal print control and key input
    ESC=$( printf "\033")
    cursor_blink_on()  { printf "$ESC[?25h"; }
    cursor_blink_off() { printf "$ESC[?25l"; }
    cursor_to()        { printf "$ESC[$1;${2:-1}H"; }
    print_option()     { printf "   $1 "; }
    print_selected()   { printf "  $ESC[7m $1 $ESC[27m"; }
    get_cursor_row()   { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
    key_input()        { read -s -n3 key 2>/dev/null >&2
                         if [[ $key = $ESC[A ]]; then echo up;    fi
                         if [[ $key = $ESC[B ]]; then echo down;  fi
                         if [[ $key = ""     ]]; then echo enter; fi; }

    # initially print empty new lines (scroll down if at bottom of screen)
    for opt; do printf "\n"; done

    # determine current screen position for overwriting the options
    local lastrow=`get_cursor_row`
    local startrow=$(($lastrow - $#))

    # ensure cursor and input echoing back on upon a ctrl+c during read -s
    trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
    cursor_blink_off

    local selected=0
    while true; do
        # print options by overwriting the last lines
        local idx=0
        for opt; do
            cursor_to $(($startrow + $idx))
            if [ $idx -eq $selected ]; then
                print_selected "$opt"
            else
                print_option "$opt"
            fi
            ((idx++))
        done

        # user key control
        case `key_input` in
            enter) break;;
            up)    ((selected--));
                   if [ $selected -lt 0 ]; then selected=$(($# - 1)); fi;;
            down)  ((selected++));
                   if [ $selected -ge $# ]; then selected=0; fi;;
        esac
    done

    # cursor position back to normal
    cursor_to $lastrow
    printf "\n"
    cursor_blink_on

    return $selected
}

echo "Select one option using up/down keys and enter to confirm:"

options=("Clean Android" "Clean iOS" "Quit")

select_option "${options[@]}"
choice=$?

echo "Choosen index = $choice"
echo "        value = ${options[$choice]}"

# Function to display the menu
display_menu() {
  clear
  echo "Menu:"
  for ((i = 0; i < ${#options[@]}; i++)); do
    echo "$((i + 1)). ${options[i]}"
  done
}

# Function to execute Option 1
cleanAndroid() {
    cd ..
    cd "$(dirname "$0")/android" || exit
    ./gradlew clean
    cd ..
    flutter pub get
}

# Function to execute Option 2
cleaniOS() {
    cd ..
    flutter clean
    cd ios || exit
    rm -Rf ios/Pods 
    rm -Rf ios/.symlinks 
    rm -Rf ios/Flutter/Flutter.framework 
    rm -Rf ios/Flutter/Flutter.podspec 
    flutter pub get
    pod install
    cd ..
}
display_menu
case "$choice" in
    0)
        clear
        echo "you selected clean android:"
        cleanAndroid
        exit 0
        ;;
    1)
        clear
        echo "you selected clean iOS:"
        cleaniOS
        exit 0
        ;;
    2)
        clear
        echo "Goodbye!"
        exit 0
        ;;
esac

