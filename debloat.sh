#!/system/bin/sh

search() {
    pm list packages | grep -x "package:$1"
}

uninstall() {
    pm uninstall -k --user 0 $1
}

debloat() {
    clear

    echo -e "Debloating...\n"

    url="https://raw.githubusercontent.com/davnpsh/samsung-debloat-script/main/debloat_list.txt"
    temp_file="/data/local/tmp/debloat_list.txt"

    curl -sSL -o $temp_file "$url"

    while IFS= read -r line; do
        # Skip empty lines and lines starting with # (comments)
        if [ -z "$line" ] || [ "${line:0:1}" = "#" ]; then
            continue
        fi

        package_name=$line

        # Search for the package and uninstall if found
        if search "$package_name" > /dev/null; then
            echo "Uninstalling $package_name"
            uninstall "$package_name"
        else
            echo "Package $package_name not found. Skipping."
        fi
    done < $temp_file

    echo -e "\nDone."
}

main() {
    clear

    echo "WARNING: I am not responsible for damages done to your device. You must always read the contents of a script you download from the Internet."

    printf "\nDo you want to proceed? [y/n] "
    read response

    case $response in
        [yY])
            debloat
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

main