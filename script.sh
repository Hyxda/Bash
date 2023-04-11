#!/bin/bash

echo "The script PID is $$."
sleep 30 &
childpid=$!
echo "Child PID is $childpid."
echo "Child process with PID $childpid is now in waiting queue."
echo "The child process is waiting for a software interrupt from the user."
trap "echo Enter the SIGINT interrupt to have the child process execute on the CPU." SIGINT
wait $childpid
trap "echo Enter SIGQUIT interrupt." SIGQUIT
wait $childpid
echo "Completed executing."
echo "Terminated all processes."
trap 'echo -e "\nSIGINT signal received."' INT
trap 'echo -e "\nSIGQUIT signal received."' QUIT
exit 0