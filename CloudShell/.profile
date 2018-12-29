zsh="$(which zsh)"
if [ -z "$zsh" ]
then
        bash /home/yahiralejandro/playground_vms/initial_pkg.sh
        exit
else
        echo "Switching to zsh..."
        exec zsh
fi
