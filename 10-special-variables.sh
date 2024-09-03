echo "All variables passed to the script is $@"
echo "How many variables passed to the script is $#"
echo "Present script name  is $0"
echo "Present working directory is $PWD"
echo "Present home directory is $HOME"
echo "PID of current script $$"
sleep 100 &
echo  "PID of last backgroud command $!" 