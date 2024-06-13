#!/system/bin/sh

device_codename=$(getprop ro.product.device)

search() {
    pm list packages | grep -x "package:$1"
}

uninstall() {
    pm uninstall -k --user 0 $1
}

display_warning() {
    clear

    echo "WARNING: I am not responsible for damages done to your device. You must always read the contents of a script you download from the Internet.\n\nDo you want to proceed? [y/n]"

    read -r response

    case $response in
        [yY])
            echo "Confirmed"
            ;;
        [nN])
            echo "User canceled. Exiting."
            exit 1
            ;;
        *)
            echo "Invalid input. Please enter 'y' for yes or 'n' for no."
            display_warning
            ;;
    esac
}

main() {
    display_warning
}

main