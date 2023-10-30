# my homelab-documentation

This is an attempt to document my homelab setup and share ideas and problems I came across.

## docker-compose

In this folder I share all the compose files I use or used in docker to run all the services one could wish for :)

Important: you will find `network_mode: bridge` in almost all compose files and ports to expose commented out. I use this setting to put all containers into the same docker network. This allows me to use dockers DNS for reverse proxy access via local domains and not via many IPs and weird ports.
Just the nginx proxy manager needs to have its ports exposed and forward to the container names with their default ports..

### basic setup

After a lot of trial and error I found it best to run Portainer via docker compose and the rest as stacks (Portainers docker compose) managed by Portainer. They even offer a business license for free for small setups with up to 3 nodes.

Watchtower is very helpful to keep docker containers up-to-date. Its running on a schedule and checks multiple times a day if newer versions of the docker images are available.
If yes it updates them and removes the old containers.

Syncthing allows me to sync files and backups between systems, laptops and phones. Runs awesome and super fast.

Wireguard is my VPN of choice to connect with full tunnels in sketchy networks or a split tunnel in everyday to take advantage of the Pihole ad blocking on the road on my phone.

Duplicati takes care of my docker container backups. It runs every night and stops the containers its set up for, makes the backup and starts them up again.
To let the duplicati container control the other containers I had to give it access to the host docker binary and socket plus a bash script to run the start/stop commands based on job running. Its all in the duplicati compose folder.

Autoheal takes care of dead containers. When there are health checks presend in the container and it dies docker itself seems to ignore it. The Autoheal container then restarts the container.

## hardware

### NAS - QNAP TS-473

Hacky solution but to save energy I use a QNAP TS-473 where I removed the firmware storage module from the mainboard to be able tu USB boot. 
This allowed me to install Unraid with SSD caching and the HDDs holding the data. Most of the day all HDDs are spun down and just the SSDs are used to save a lot of energy and just write the data of the day to the HDDs at night.  
Still I can't get it below 40W power consumption.

#### NAS HDDs

For NAS HDDs I use WD RED drives which are a little bit slower than Seagate Ironwolf but have less power consumption (5400rpm vs 7200rpm). Buing them directly is fine but I mostly chose to buy WD Elements external HDDs on Amazon and break them open. In all bigger models are white label WD Red drives build in with SATA connectors. 

### Thin client - Lenovo M910Q

This is the newest addition. A small computer with still good amount of power. An Intel i5 4 core processor, 32GB Ram and 256GB + 2TB SSDs.
The software running here is Proxmox as a VM hypervisor and a Ubuntu server VM to run all the docker containers.
Thin clients are an awesome solution with lots of compute and little footprint and consumption. 
Mine runs almost 40 containers and still uses about 25W.

### Raspberry Pi's

Everyone used them... In the beginning they did a lot now its down to two Pi 3's running Pihole for ad blocking and local DNS to make pretty *.lan domains work.
