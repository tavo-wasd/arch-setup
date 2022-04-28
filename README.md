# arch-setup
Simple script to get communication, creative, games and office apps automatically in arch linux.
To download the file: Head to the downloads folder, then right-click and open in terminal. Or open a brand new terminal and go to your downloads directory using: 'cd /home/YourUser/Downloads' and follow steps to clone, edit and run the script:

    1. Execute this command to download the files:
        (git must be installed) ( either 'sudo apt install git' or 'sudo pacman -S git' )
        'git clone https://github.com/tavo-wasd/arch-setup'
        
    2. Then, enter the folder and open in terminal, or simply execute:
        'cd arch-setup'
        
    3. Once inside the folder, get permission over the .sh file with:
        'sudo chmod +x setup.sh'
        
    4. You can edit the file with your text editor (like: gedit, kwrite, xed) by right clicking, or executing the command:
        YourTextEditor setup.sh (in the "/home/YourUser/Downloads" directory).
        To enable commands comment or uncomment them by using '#'
        CHANGE EVERY "tavo" entry for your own username in your arch system.
        
    5. To RUN this script, execute command (from the script's directory):
        'sudo ./setup.sh'
        It may ask for your password and then it'll start executing.
        answer the [y/n] prompts since there's no default answer.
