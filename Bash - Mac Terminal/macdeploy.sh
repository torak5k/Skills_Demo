#!/bin/bash

# What this script is meant to do:
    # Detect the processor architecture of the machine.
    # After determining if the machine uses an Intel or Apple Silicon processor, it gives the user the ability to download the following programs that are appropriate for the processor architecture:
        # Office 365
        # Slack
        # Google Chrome
        # Google Drive
        # Zoom

    # Install the following programs:
        # Office 365
        # Slack
        # Google Chrome
        # Google Drive
        # Zoom
    # Change the name of the system.

# NOTE: Make sure the install files are in the same folder as the script itself. 

# Location where you can get the latest version of MS Office, and even download installers that don't include Teams:
# https://docs.microsoft.com/en-us/officeupdates/update-history-office-for-mac#most-current-packages-for-office-for-mac

# NOTE: One way to detect the processor architecture is with the following command: echo $MACHTYPE
# NOTE: Another way to detect processor architecture: sysctl -n machdep.cpu.brand_string


# Need to set up download and install options for M1 and Intel Macs. 

mac_deploy_intel(){
    # Option 0: Downloading the programs.
    download_programs_intel(){

        # One issue that I'm running into, is the machine going to sleep while the downloads are happenning, causing them to be ineterrupted. Let's try using the caffeinate command.

        caffeinate -s & # This should keep the machine awake while plugged in, and have this process be moved to the background. 

        ### DOWNLOADING OFFICE 365 ###
        echo ""
        echo ""
        echo "Downloading Office 365 (Universal)..."
        echo ""
        curl -O https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Office_16.55.21111400_Installer.pkg

        ### DOWNLOADING SLACK ###
        echo ""
        echo ""
        echo "Downloading Slack (Intel)..."
        echo ""
        curl -O https://downloads.slack-edge.com/releases/macos/4.23.0/prod/x64/Slack-4.23.0-macOS.dmg

        ### DOWNLOADING GOOGLE CHROME ###
        echo ""
        echo ""
        echo "Downloading Google Chrome (Universal)..."
        echo ""
        curl -O https://dl.google.com/dl/chrome/mac/universal/stable/gcem/GoogleChrome.pkg

        ### DOWNLOADING GOOGLE DRIVE ###
        echo ""
        echo ""
        echo "Downloading Google Drive (Universal)..."
        echo ""
        curl -O https://dl.google.com/drive-file-stream/GoogleDrive.dmg

        ### DOWNLOADING ZOOM ###
        echo ""
        echo ""
        echo "Downloading Zoom (Universal)..."
        echo ""
        curl -O https://cdn.zoom.us/prod/5.8.6.2879/Zoom.pkg
    }

    # Option 1:
    install_programs_intel(){
        ### INSTALLING MICROSOFT OFFICE ###
        sudo installer -pkg Microsoft_Office_16.55.21111400_Installer.pkg -target /Applications -verbose # Without MS Teams.


        ### INSTALLING SLACK ###
        hdiutil mount Slack-4.23.0-macOS.dmg
        cp -Rv "/Volumes/Slack" /Applications
        hdiutil unmount "/Volumes/Slack" 


        ### INSTALLING GOOGLE CHROME ###
        sudo installer -pkg GoogleChrome.pkg -target /Applications -verbose


        ### INSTALLING GOOGLE DRIVE ###
        hdiutil mount GoogleDrive.dmg
        sudo installer -pkg "/Volumes/Install Google Drive/GoogleDrive.pkg" -target "/Volumes/Macintosh HD" -verbose
        hdiutil unmount "/Volumes/Install Google Drive"


        ### INSTALLING ZOOM ###
        sudo installer -pkg Zoom.pkg -target /Applications -verbose # Sudo is needed.

    }

    # Option 2: 
    install_xcode_cmd_line_tools_intel(){
        git --help  # This will prompt the user to install the command line tools for Xcode.
    }

    # Option 3: 
    install_catalina_intel(){
        open https://apps.apple.com/us/app/macos-catalina/id1466841314?mt=12
    }

    # Option 4
    install_big_sur_intel(){
        open https://apps.apple.com/us/app/macos-big-sur/id1526878132?mt=12
    }

    # Option 5: 
    change_computer_name_intel(){
        echo "WARNING: THIS WILL REBOOT YOUR SYSTEM!!!"
        read -p "What's the name of the new computer? " NewComputerName

        sudo scutil --set ComputerName $NewComputerName
        # The way to test: scutil --get ComputerName
        sudo scutil --set LocalHostName $NewComputerName
        # The way to test: scutil --get LocalHostName
        sudo scutil --set HostName $NewComputerName
        # The way to test: scutil --get HostName

        echo "System will reboot shortly!"
        sudo shutdown -r +00:15
    }


    # Detecting the processor architecture:
    proc_architecture=$(sysctl -n machdep.cpu.brand_string)
    echo ""
    echo ""
    echo "Detected processor architecture: $proc_architecture"
    echo ""


    while true 
    do
        echo 
        echo "Choose the following options:"
        echo "0: Download the following programs:
            - Office 365
            - Slack
            - Google Chrome
            - Google Drive
            - Zoom" 
        echo "1: Install the following programs:
            - Office 365
            - Slack
            - Google Chrome
            - Google Drive
            - Zoom"
        echo "2: Install Xcode command line tools (DON'T RUN AND THEN UPGRADE TO A NEWER VERSION OF MACOS)"
        echo "3: Install macOS Catalina"
        echo "4: Install macOS Big Sur"
        echo "5: Change the computer name (WILL REBOOT SYSTEM AFTER NAME CHANGE!!!)"
        echo "6: Exit"
        echo
        echo
        read -p "Please enter a number from the list: " choice

        case $choice in
            0) download_programs_intel;; # End of choice 0.
            1) install_programs_intel;; # End of choice 1. 
            2) install_xcode_cmd_line_tools_intel;; # End of choice 2.
            3) install_catalina_intel;; # End of choice 3.
            4) install_big_sur_intel;; # End of choice 4.
            5) change_computer_name_intel;; # End of choice 5.
            6) exit 0;; # End of choice 6.
        esac

    done
}

mac_deploy_m1(){
    # Option 0: Downloading the programs (Apple Silicon).
    download_programs_m1(){

        # One issue that I'm running into, is the machine going to sleep while the downloads are happenning, causing them to be ineterrupted. Let's try using the caffeinate command.

        caffeinate -s & # This should keep the machine awake while plugged in, and have this process be moved to the background. 

        ### DOWNLOADING OFFICE 365 ###
        echo ""
        echo ""
        echo "Downloading Office 365 (Universal)..."
        echo ""
        curl -O https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Office_16.55.21111400_Installer.pkg


        ### DOWNLOADING SLACK ###
        echo ""
        echo ""
        echo "Downloading Slack (M1)..."
        echo ""
        curl -O https://downloads.slack-edge.com/releases/macos/4.23.0/prod/arm64/Slack-4.23.0-macOS.dmg

        ### DOWNLOADING GOOGLE CHROME ###
        echo ""
        echo ""
        echo "Downloading Google Chrome (Universal)..."
        echo ""
        curl -O https://dl.google.com/dl/chrome/mac/universal/stable/gcem/GoogleChrome.pkg

        ### DOWNLOADING GOOGLE DRIVE ###
        echo ""
        echo ""
        echo "Downloading Google Drive (Universal)..."
        echo ""
        curl -O https://dl.google.com/drive-file-stream/GoogleDrive.dmg

        ### DOWNLOADING ZOOM ###
        echo ""
        echo ""
        echo "Downloading Zoom (M1)..."
        echo ""
        curl -O https://cdn.zoom.us/prod/5.8.6.2879/arm64/Zoom.pkg
    }

    # Option 1:
        install_programs_m1(){
            ### INSTALLING MICROSOFT OFFICE ###
            sudo installer -pkg Microsoft_Office_16.55.21111400_Installer.pkg -target /Applications -verbose # Without MS Teams.

            ### INSTALLING SLACK ###
            hdiutil mount Slack-4.23.0-macOS.dmg
            cp -Rv "/Volumes/Slack" /Applications
            hdiutil unmount "/Volumes/Slack" 


            ### INSTALLING GOOGLE CHROME ###
            sudo installer -pkg GoogleChrome.pkg -target /Applications -verbose


            ### INSTALLING GOOGLE DRIVE ###
            hdiutil mount GoogleDrive.dmg
            sudo installer -pkg "/Volumes/Install Google Drive/GoogleDrive.pkg" -target "/Volumes/Macintosh HD" -verbose
            hdiutil unmount "/Volumes/Install Google Drive"


            ### INSTALLING ZOOM ###
            sudo installer -pkg Zoom.pkg -target /Applications -verbose # Sudo is needed.

        }

        # Option 2: 
        install_xcode_cmd_line_tools_m1(){
            git --help  # This will prompt the user to install the command line tools for Xcode.
        }

        # Option 3: 
        change_computer_name_m1(){
            echo "WARNING: THIS WILL REBOOT YOUR SYSTEM!!!"
            read -p "What's the name of the new computer? " NewComputerName

            sudo scutil --set ComputerName $NewComputerName
            # The way to test: scutil --get ComputerName
            sudo scutil --set LocalHostName $NewComputerName
            # The way to test: scutil --get LocalHostName
            sudo scutil --set HostName $NewComputerName
            # The way to test: scutil --get HostName

            echo "System will reboot shortly!"
            sudo shutdown -r +00:15
        }


        # Detecting the processor architecture:
        proc_architecture=$(sysctl -n machdep.cpu.brand_string)
        echo ""
        echo ""
        echo "Detected processor architecture: $proc_architecture"
        echo ""


        while true 
        do
            echo 
            echo "Choose the following options:"
            echo "0: Download the following programs:
                - Office 365
                - Slack
                - Google Chrome
                - Google Drive
                - Zoom" 
            echo "1: Install the following programs:
                - Office 365
                - Slack
                - Google Chrome
                - Google Drive
                - Zoom"
            echo "2: Install Xcode command line tools (DON'T RUN AND THEN UPGRADE TO A NEWER VERSION OF MACOS)"
            echo "3: Change the computer name (WILL REBOOT SYSTEM AFTER NAME CHANGE!!!)"
            echo "4: Exit"
            echo
            echo
            read -p "Please enter a number from the list: " choice

            case $choice in
                0) download_programs_m1;; # End of choice 0.
                1) install_programs_m1;; # End of choice 1. 
                2) install_xcode_cmd_line_tools_m1;; # End of choice 2.
                3) change_computer_name_m1;; # End of choice 3.
                4) exit 0;; # End of choice 4.
            esac

        done

}




# Detecting the processor architecture:
proc_architecture=$(sysctl -n machdep.cpu.brand_string)
echo ""
echo ""
echo "Detected processor architecture: $proc_architecture"
echo ""


if [[ $proc_architecture == *"Intel"* ]]; then
    mac_deploy_intel
else
    mac_deploy_m1
fi

