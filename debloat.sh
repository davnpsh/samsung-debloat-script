#!/system/bin/sh

device_codename=$(getprop ro.product.device)

search() {
    pm list packages | grep -x "package:$1"
}

uninstall() {
    pm uninstall -k --user 0 $1
}

debloat() {
    echo $1
}

select_device() {
    clear

    device_codenames=("a20s")

    echo "For reference, your device codename is: $device_codename"

    echo -e "\nSelect a supported device:\n"
    for i in "${!device_codenames[@]}"; do
        echo "[$((i+1))] ${device_codenames[i]}"
    done

    printf "\nYour option: "
    read choice

    if [[ $choice -ge 1 && $choice -le ${#device_codenames[@]} ]]; then
        selected_device=${device_codenames[choice-1]}
        debloat_list="https://raw.githubusercontent.com/davnpsh/samsung-debloat-script/main/devices/$selected_device"

        debloat $debloat_list
    else
        echo "Invalid choice. Please select a valid number."
        exit 1
    fi
}

display_warning() {
    clear

    echo "WARNING: I am not responsible for damages done to your device. You must always read the contents of a script you download from the Internet."

    printf "\nDo you want to proceed? [y/n] "
    read response

    case $response in
        [yY])
            select_device
            ;;
        [nN])
            echo "User canceled. Exiting."
            exit 1
            ;;
        *)
            echo "Invalid input. Please enter 'y' for yes or 'n' for no."
            exit 1
            ;;
    esac
}

main() {
    display_warning
}

main