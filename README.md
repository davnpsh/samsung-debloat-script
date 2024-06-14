# Samsung Debloat Script (SDS)

This is a script to automate the process of debloating a Samsung phone. In the `debloat_list.txt` file are packages that will **remove Google and Samsung bloatware** (as well as other apps such as Facebook, Netflix, etc.).

This script will only leave essential apps (calculator, notes, file explorer) and most features (Smart Switch, Android Auto and connectivity in general), so this **WON'T** handicap your phone. I tested this configuration for more than half a year and it works perfectly fine.

## Run the script

### ⚠️ I am NOT responsible for damages done to your device. You must always read the contents of a script you download from the Internet.

1. First, you must be able to access a terminal within your phone using this command in your computer:

    ```sh
    adb shell
    ```

    If you don't know how to install `adb` or access a terminal with it, check this [guide](https://www.reddit.com/r/samsung/comments/rzhz13/ultimate_samsung_oneui_debloat_privacy/).

2. Download the script to your phone:

    ```sh
    curl -sSL -o /data/local/tmp/debloat.sh https://raw.githubusercontent.com/davnpsh/samsung-debloat-script/main/debloat.sh
    ```

3. Make it executable:

    ```sh
    chmod +x /data/local/tmp/debloat.sh
    ```

4. Run the script:

    ```sh
    /data/local/tmp/debloat.sh
    ```

## 🚫 No Google Play Store or Galaxy Store

This script will remove both stores from your phone, so I suggest using [Obtainium](https://github.com/ImranR98/Obtainium), [Aurora Store](https://auroraoss.com/) or [F-Droid](https://f-droid.org/) to download apps.

## Credits

Most information I read about apps and what they do was from [here](https://docs.google.com/spreadsheets/d/12jEGQftFUL3vAI03X0Ku1LgoWFQKdwPA_WHuLh_2ics/edit?gid=0#gid=0).