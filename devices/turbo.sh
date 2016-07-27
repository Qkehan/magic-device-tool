#!/bin/bash
clear
echo ""
echo "Meizu Pro 5 - turbo"
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo ""
echo "[2] Quit "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
  clear
  adb start-server
  echo "  "
  echo "Install Ubuntu"
  echo ""
  sleep 1
  echo "[1] Choose a channel to flash with the --wipe option (Will remove existing apps/data)"
  echo "[2] Choose a channel to switch your device to (Will keep existing apps/data) "
  sleep 1
  echo ""
  echo -n "Enter option: "; read optionubuntu
  if [ "$optionubuntu" = "1" ]; then
    clear
    echo ""
    echo "Choose a channel to flash with the --wipe option (Will remove existing apps/data)"
    echo ""
    sleep 1
    echo "[1] stable"
    echo "[2] rc-proposed"
    echo ""
    echo -n "Enter option: "; read ubuntuwipechannel
    if [ "$ubuntuwipechannel" = "1" ]; then
      clear
      echo ""
      echo "Flashing stable channel"
      echo ""
      sleep 1
      echo "Please enable developer mode on the device"
      echo "this is located in system-settings → About → Developer Mode"
      echo ""
      echo "Please confirm the pairing dialog on the device"
      echo ""
      sleep 1
      echo -n "Did you enable developer mode ? [Y/N] "; read developermode
      if [ "$developermode"==Y -o "$developermode==y" ]; then
        clear
        echo ""
        echo "Detecting device"
        echo ""
        sleep 1
        adb devices >~/.AttachedDevices
        echo ""
        sleep 1
        if grep 'device$\|device$' ~/.AttachedDevices
        then
          echo ""
          echo "Device detected !"
          sleep 1
          clear
          echo ""
          echo "Flashing stable channel"
          echo ""
          adb reboot-bootloader
          echo "Please wait"
          sleep 6
          wget https://git.launchpad.net/~device-release/turbo/+git/recovery/plain/recovery.img
          sleep 1
          clear
          echo ""
          ubuntu-device-flash touch --bootstrap --device turbo --channel ubuntu-touch/stable/meizu.en --recovery-image recovery.img
          sleep 1
          echo ""
          echo "Move to your device to finish the setup."
          sleep 1
          echo ""
          echo "Cleaning up.."
          rm -f ~/.AttachedDevices
          rm recovery.img
          echo ""
          sleep 1
          echo "Exiting script. Bye Bye"
          sleep 1
          exit
        else
          echo "Device not found"
          exit
        fi
        echo "Device not found."
        exit
      else
        if [ "$developermode"==N -o "$developermode==n"]; then
          echo ""
          sleep 1
          echo "Exiting script. Bye Bye"
          sleep 1
          exit
        else
          echo "Invalid Option"
          echo ""
          echo "Exiting script. Bye Bye"
          exit
        fi
      fi
    else
      if [ "$ubuntuwipechannel" = "2" ]; then
        clear
        echo ""
        echo "Flashing rc-proposed channel"
        echo ""
        sleep 1
        echo "Please enable developer mode on the device"
        echo "this is located in system-settings → About → Developer Mode"
        echo ""
        echo "Please confirm the pairing dialog on the device"
        echo ""
        sleep 1
        echo -n "Did you enable developer mode ? [Y/N] "; read developermode
        if [ "$developermode"==Y -o "$developermode==y" ]; then
          clear
          echo ""
          echo "Detecting device"
          echo ""
          sleep 1
          adb devices >~/.AttachedDevices
          echo ""
          sleep 1
          if grep 'device$\|device$' ~/.AttachedDevices
          then
            echo ""
            echo "Device detected !"
            sleep 1
            clear
            echo ""
            echo "Flashing rc-proposed channel"
            echo ""
            adb reboot-bootloader
            echo "Please wait"
            sleep 6
            wget https://git.launchpad.net/~device-release/turbo/+git/recovery/plain/recovery.img
            sleep 1
            clear
            echo ""
            ubuntu-device-flash touch --bootstrap --device turbo --channel ubuntu-touch/rc-proposed/meizu-pd.en --recovery-image recovery.img
            sleep 1
            echo ""
            echo "Move to your device to finish the setup."
            sleep 1
            echo ""
            echo "Cleaning up.."
            rm -f ~/.AttachedDevices
            rm recovery.img
            echo ""
            sleep 1
            echo "Exiting script. Bye Bye"
            sleep 1
            exit
          else
            echo "Device not found"
            exit
          fi
          echo "Device not found."
          exit
        else
          if [ "$developermode"==N -o "$developermode==n"]; then
            echo ""
            sleep 1
            echo "Exiting script. Bye Bye"
            sleep 1
            exit
          else
            echo "Invalid Option"
            echo ""
            echo "Exiting script. Bye Bye"
            exit
          fi
        fi
      fi
    fi
  else
    if [ "$optionubuntu" = "2" ]; then
      clear
      echo ""
      echo "Choose a channel to flash / Switch channel "
      echo "Your Apps/Data won't be touched, it will just reinstall Ubuntu / switch the channel."
      echo ""
      sleep 1
      echo "[1] stable"
      echo "[2] rc-proposed"
      echo ""
      echo -n "Enter option: "; read ubuntukeepchannel
      if [ "$ubuntukeepchannel" = "1" ]; then
        clear
        echo ""
        echo "Flashing stable channel"
        echo ""
        sleep 1
        echo "Please enable developer mode on the device"
        echo "this is located in system-settings → About → Developer Mode"
        echo ""
        echo "Please confirm the pairing dialog on the device"
        echo ""
        sleep 1
        echo -n "Did you enable developer mode ? [Y/N] "; read developermode
        if [ "$developermode"==Y -o "$developermode==y" ]; then
          clear
          echo ""
          echo "Detecting device"
          echo ""
          sleep 1
          adb devices >~/.AttachedDevices
          echo ""
          sleep 1
          if grep 'device$\|device$' ~/.AttachedDevices
          then
            echo ""
            echo "Device detected !"
            sleep 1
            clear
            echo ""
            echo "Flashing stable channel"
            echo ""
            adb reboot-bootloader
            echo "Please wait"
            echo ""
            sleep 10
            wget https://git.launchpad.net/~device-release/turbo/+git/recovery/plain/recovery.img
            sleep 1
            fastboot flash recovery recovery.img
            sleep 1
            fastboot boot recovery.img
            sleep 10
            adb reboot recovery
            sleep 17
            clear
            echo ""
            ubuntu-device-flash touch --device turbo --channel ubuntu-touch/stable/meizu.en
            sleep 1
            echo ""
            echo "Move to your device to finish the setup."
            sleep 1
            echo ""
            echo "Cleaning up.."
            rm -f ~/.AttachedDevices
            rm recovery.img
            echo ""
            sleep 1
            echo "Exiting script. Bye Bye"
            sleep 1
            exit
          else
            echo "Device not found"
            exit
          fi
          echo "Device not found."
          exit
        else
          if [ "$developermode"==N -o "$developermode==n"]; then
            echo ""
            sleep 1
            echo "Exiting script. Bye Bye"
            sleep 1
            exit
          else
            echo "Invalid Option"
            echo ""
            echo "Exiting script. Bye Bye"
            exit
          fi
        fi
      else
        if [ "$ubuntukeepchannel" = "2" ]; then
          clear
          echo ""
          echo "Flashing rc-proposed channel"
          echo ""
          sleep 1
          echo "Please enable developer mode on the device"
          echo "this is located in system-settings → About → Developer Mode"
          echo ""
          echo "Please confirm the pairing dialog on the device"
          echo ""
          sleep 1
          echo -n "Did you enable developer mode ? [Y/N] "; read developermode
          if [ "$developermode"==Y -o "$developermode==y" ]; then
            clear
            echo ""
            echo "Detecting device"
            echo ""
            sleep 1
            adb devices >~/.AttachedDevices
            echo ""
            sleep 1
            if grep 'device$\|device$' ~/.AttachedDevices
            then
              echo ""
              echo "Device detected !"
              sleep 1
              clear
              echo ""
              echo "Flashing rc-proposed channel"
              echo ""
              adb reboot-bootloader
              echo "Please wait"
              sleep 10
              wget https://git.launchpad.net/~device-release/turbo/+git/recovery/plain/recovery.img
              sleep 1
              fastboot flash recovery recovery.img
              sleep 1
              fastboot boot recovery.img
              sleep 10
              adb reboot recovery
              sleep 17
              clear
              echo ""
              ubuntu-device-flash touch --device turbo --channel ubuntu-touch/rc-proposed/meizu-pd.en
              sleep 1
              echo ""
              echo "Move to your device to finish the setup."
              sleep 1
              echo ""
              echo "Cleaning up.."
              rm -f ~/.AttachedDevices
              rm recovery.img
              echo ""
              sleep 1
              echo "Exiting script. Bye Bye"
              sleep 1
              exit
            else
              echo "Device not found"
              exit
            fi
            echo "Device not found."
            exit
          else
            if [ "$developermode"==N -o "$developermode==n"]; then
              echo ""
              sleep 1
              echo "Exiting script. Bye Bye"
              sleep 1
              exit
            else
              echo "Invalid Option"
              echo ""
              echo "Exiting script. Bye Bye"
              exit
            fi
          fi
        fi
      fi
    else
      echo ""
      echo "Exiting script. Bye Bye"
    fi
  fi
else
        if [ "$option" = "2" ]; then
          echo "Exiting script. Bye Bye"
          exit
        else
          echo "Exiting script. Bye Bye"
        fi
      fi
