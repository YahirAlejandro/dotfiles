zsh="$(which zsh)"
if [ -z "$zsh" ]
then
        bash /home/${USER}/REPLACE_THIS_PATH/cs_startup.sh
        exit
else
        echo "Switching to zsh..."
        exec zsh
fi
