# lsof rc

## Get pid/name by port

get process name and PID from it by port
<https://stackoverflow.com/questions/4247932/how-to-parse-netstat-command-in-order-to-get-process-name-and-pid-from-it#4250355>

    ps -p $(lsof -ti tcp:3300) o comm=,pid=

## Process/program wich open files

Find and close process/program wich open removed files.
Space will not be freed until they are closed.
<http://unix.stackexchange.com/questions/34140/tell-fs-to-free-space-from-deleted-files-now#34143>

    lsof | grep deleted
