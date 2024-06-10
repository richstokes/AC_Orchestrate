Orchestrator for quickly copying Assetto Corsa and launching server packs on a dedicated server.  


## Requirements
1. A Linux server running somewhere (tested with Ubuntu)  
(Enable SSH key authentication for a smoother experience)
2. [Content Manager](https://acstuff.ru/app/)


## Process
1. Clone this repo to a directory on your PC
1. Create the server(s) you wish to run using content manager, if creating more than one, make sure all the port numbers are unique
1. Export the servers using the "pack" button in content manager to tar.gz files
1. Place the tar.gz files in the same directory as this script
1. Run `./ac_orchestrate.sh <user@server>`, e.g. `./ac_orchestrate.sh ac@64.23.248.250`
1. This script will then copy the packs to the server, extract them into their own directories, and then launch them all using screen 
1. If you make a change or want to add another server to the same host, just replace the tar.gz packs and run the script again


## Management
If you need to open the console of one of the servers, SSH into your host and run `screen -ls` to view them. Then do `screen -r <PID>` to open it's console. 