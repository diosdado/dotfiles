


```bash
# like who but more detailed

# apagado linux
shutdown -hp now

# iniciar agentes de zabbix en openbsd
doas rcctl enable zabbix_agentd
doas rcctl start zabbix_agentd

w

# restart php
doas /etc/rc.d/php56_fpm restart

# restart mysql
sudo systemctl restart mysql


ssh-copy-id {server-ip}

ssh-keygen -t ed25519 -C "david.diosdado@.sandox.com.mx"





```
# tmux and nvim navigation


|combo|action|
|-|-|
|alt+j|previous nvim buffer |
|alt+k|next nvim buffer|
|alt+l|toggle nvim buffer|
|cmd+j|previous tmux session|
|cmd+k|next tmux session|
|cmd+l|toggle tmux sessions|


# ffmpeg
```bash
# trim without re-encoding
ffmpeg -i input.mov -ss 00:00:00 -t 01:45:13 -c:v copy -c:a copy output.mov
# trim with re-encoding
ffmpeg -i input.mov -ss 00:00:00 -t 01:45:13 -c:a copy output2.mov

```




# applayer


|key|action|key|action|
|-|-|-|-|
|=|karabiner|6 |focus left |
|1|stickies to third display |7|swap left |
|2|cycle layouts |8|swap right |
|3|float window |9|focus right |
|4|fullscreen |0|opacity on focus|
|5|main window |-|mouse focus|
| | &nbsp | | |
| | &nbsp | | |
|tab| restart yabai  |y| reminders |
|q| yabai default  |u| terminal |
|w| yabai design  |i| browser |
|e| yabai office  |o| whatsapp |
|r| yabai conference  |p| email |
|t| yabai terminal |  \ | mamp |
| | &nbsp | | |
| | &nbsp | | |
| esc | layer app  |h| left |
|a|mission control  |j| down |
|s|show desktop | k| up |
|d| left click | l| right |
|f| ftp| ;| design |
|g|MAMP | '| windows app |
| | &nbsp | | |
| | &nbsp | | |
| left_shift  | eyedropper |n| office |
|z| finder | m| conference |
|x|SUSE Learning Center   |,| clipboard |
|c|   |.| clipboard |
|v|   |/| entertainment |
|b| obs  | right_shift |SUSE Learning Center  |
| | &nbsp | | |
| | &nbsp | | |
|left_ctrl | free ruler |right_cmd| |
|~|eject |  right_option | |
|fn| |[|ctrl + shift + tab |
|left_alt | |  ]|ctrl + tab |
|left_cmd | |right_ctrl| |
| | &nbsp | | |
| | &nbsp | | |
|left|home|home | |
|right |end|end | |
|up |page up|page up | |
|down |page down|page down | |
|backspace | |space | ctrl + a |
|delete (spacebar) | | return| |



# dns servers

- OpenDNS
    - 208.67.222.222
    - 208.67.220.220
    - Yandex
    - 77.88.8.8
    - 77.88.8.1




# test

| param | test |
|-|-|
| -b | exists block|
| -c | exists char|
| -d | exists dir|
| -e | exists|
| -w | writable|
| -x | executable|
| -r | readable|
| -nt | newer|
| -ot | older|
| -ef | equal file|
| -n | string nonzero|
| -z | string zero|
| = | string equal|
| != | string non equal|
| -eq | equal|
| -ne | not equal|
| -gt | greater than|
| -ge | greater or equal|
| -lt | lower than|
| -le | lower or equal|




# ls
```bash
# list only directories
ls -d */
```


|Symbol|Filetype|
|-|-|
|-| regular files (data)|
|d| directory (metadata)|
|b| block device|
|c| character device|
|p| pipe device|
|s| socket device|
|l| symlink|






# find

|Param|Action|
|-|-|
| -print0 | don't output results|
| -iname | case insensitive|
| -mtime 0 | time rounded to the last 24 hours|
| -mmin 1 | modified in the last minute|
| -maxdepth | levels|
| -type d/f | filetype|
| -size +1024b | find files bigger than 1024 bytes|

---

# tee

|Param|Action|
|-|-|
| -a | append|


# trim
|Param|Action|
|-|-|
|-s | squeeze multiple instances of the character to only one instance|
|-d | delete characters|


# cut

|Param|Action|
|-|-|
| -d | delimiter (in quotes)|
| -f | fields separated by commas|


# wc
word count

|Param|Action|
|-|-|
|-l | count lines|


# grep (gnu)
|Param|Action|
|-|-|
|-i | case insensitive|


# touch
```bash
touch -d "1 day ago" {filename}
```



# useradd
```bash
# create user with it's home directory
useradd -m {username}

# copy skel
mkhomedir_helper {username}

# copy skel manually
doas mkdir /home/david.diosdado
doas cp -r /etc/skel/ /home/david.diosdado
doas chown -R david.diosdado:david.diosdado /home/david.diosdado

# edit group related files locking them#
vipw
```


|Params|
|-|
| -p {password}|
| -d {directory}|
| -c {name}|
| -u {uid}|
| -g {primary-group}|
| -g {secondary,groups}|


| user defaults | description |
|-|-|
|/etc/defaults/useradd | defaults settings for account creation|
|/ets/login.defs | aging defaults|
|/ets/skel|directory structure|


# usermod
```bash
# add user to a secondary group
usermod -a -G {groupname}
```


|Params| description |
|-|-|
| -g {group} | change primary group |
| -G {groups} | change or add suplementary groups|
| -a | add-suplementary-group |
| -l {name} | change login name |
| -L  | lock account|
| -U  | unlock account|
| -e {date} | expiration date |


# userdel
```bash
userdel {username}
```


|Params| description |
|-|-|
| -r | remove user's home directory and mail spool |
| -f | force -r, even if the user is logged in|


# groupadd
```bash
groupadd {groupname}
```


|Params| description |
|-|-|
| -g | set group id |
| -r | create group id in the system group id range |


# groupmod
```bash
groupmod {groupname}
```


|Params| description |
|-|-|
| -g | change group id|
| -n | change the name of the group |


# groupdel
```bash
groupdel {groupname}
```

# passwd
```bash
passwd {username}
```


|Params| description |
|-|-|
| -d | delete account password |
| -e | expire passwdor immediately|
| -l | (lock) disable account access using a password|
| -u | (unlock) enable account access using a password|
| -w {days} | display a warning {days} before the password expires|


## /etc/shadow structure
```bash
# {1}:{2}:{3}:{4}:{5}:{6}:{7}:
```
|column| description |
|-|-|
| 1| username|
| 2| encrypted password|
| 3| date of last change|
| 4| minimum days between changes|
| 5| days password is valid|
| 6| grace days|
| 7| date of expiration (lock)|



# chage
```bash
chage {username}

# fully lock the account:
usermod -L {username}
chage -E 0 {username}
```


|Params| description |
|-|-|
| -l | view password info|
| -E {YY-mm-d} | set expiration date|
| -E -1  | disable expiration date|
| -I {days} | days of inactivity after expiration before locking the account|
| -m {days}| minimum days before a password change|
| -M {days}| maximum days password will be valid|
| -d {YY-mm-d} | change date of last password change|
| -w {days}| set password expiration warning days|


# chmod
```bash
chmod (-R) {ref}{operator}{modes}/{octets} {file/dir}

# set all special permissions (setuid, setgid and sticky bit)
chmod ug+s,+t {file/dir}

# readable/executable by everyone and writable by owner only
chmod u=rwx,go=u-w

# default permission values: file 666, dir 777
# umask is set in /etc/login.defs
```


|symbols| description |
|-|-|
| a |all|
| u |user|
| g |group|
| o |other (world)|
| r |read/view|
| w |write/modify contents|
| x |execute/search|
| - |remove|
| + |add|
| = |clear|
| s | suid/sgid |
| S | suid/sgid (not executable)|
| t | sticky bit |
| T | sticky bit (not executable)|

---

| hex | permission|
|-|-|
|4|read|
|2|write|
|1|execute|

---

|symbol |position|hex|permission| file | directory |
|-|-|-|-|-|-|
|s/S| --s------ | 4 | suid |executed has uid of file owner|no effect|
|s/S| -----s--- | 2 |sgid|executed has gid of owner|file/dir created inherits gid of parent|
|t/T| --------t | 1 |sticky bit|protects from deletion|protects from deletion|



# chown
```bash
chown -R {owner}:{group} {file/dir}
```


# ACLs Access Control Lists


# getfacl
```bash
# getfacl and setfacl are in the package 'acl'
# acl are marked with a +

# list parameters for the file system (check if acl is allowed)
tune2fs
```


|Params| description |
|-|-|
| -a | displya only the file access control list component|
| -d | display only the default access control list component|
| -R | liste the ACLs of all files and directories recursively|


## umask
- default permissions assigned to newly created files and dirs
- if permission is specified then is allowed
- applies to named users and all groups
- not applied to the file owner and other


# systemd
```bash
    man systemctl.special
    systemctl list-units --type=target
    systemctl isolate multiuser.target # change the current target to test only multiuser.target
    systemctl get-default
    systemctl set-default {multi-user.target}
    systemctl default # switch to the default target
    systemctl # list all commands
    systemctl -t help # list unit types
    systemctl -t service # list units of type service
    systemctl enable {unit/path}
    systemctl enable --now {unit/path} # enable and start the service
    systemctl is-enabled {unit/path}
    systemctl disable {unit/path}
    systemctl disable --now {unit/path} # disable and stop the service
    systemctl restart {pattern}
    systemctl reload {pattern}  # ask all units listed to reload the configuration of the service they manage
    systemctl mask --now {pattern}
    systemctl unmask --now {pattern}

```
- enabling a service creates a symllink in /etc/systemd/system

## masking a unit
- ensures the service cannot run
- the symlinks point to /dev/null instead of the real service unit


## commands




## units
- organhize boot process
- initialize hardware
- mount file-system
- manage services
- maintain tasks and processes

## unitfile
|directory|priority|description|
|-|-|-|
|/usr/lib/systemd/system|1|default location|
|/run/systemd/system|2|unit files created at runtime|
|/etc/systemd/system|3|unit files created by administrators<br>they modify unit behavior|

|Section|description|directives|
|-|-|-|
|[Unit]|metadata and configuration|Description, After, Before, Requires|
|[{unit-type-section}]|configuration specific for the type| -|
|Service|configuratin for the servidce|Type (startup type, tipically simple), ExcecStart (commands to start the service), ExcecStop (commands to stop the service), ExecReload, Restart|


### Unit

|type| description|
|-|-|
|Description| A short humanly readable title for the unit|
|After| This unit will be started after the named unit|
|Before| This unit must be started before the named unit|
|Requieres|Declares a dependency of the named unit|

### Service

|type| description|
|-|-|
|ExcecStart|commands and arguments excecuted to start the service|
|ExcecStop|commands and arguments excecuted to stop the service|
|ExcecReload|commands to excecute to trigger a configuration reload in the service|
|Restart|Configures whether the service's main process should be restarted when it exits, is killed or a timeout reached|

### Targets
- define a state the system can be in





|type| description|
|-|-|
|multi-user.target |includes networking and multiuser support |
|graphical.target|adds a graphical environment |
|emergency.target|provides an emergency shell providing a minimal system |
|halt.target|shuts down the system but does not power it off|
|reboot.target|reboots the system and should not be called directly. use systemctl reboot|


### Install
|type| description|
|-|-|
|WantedBy| Specifies the dependencies to configure when a unit is enabled|
|RequiredBy|Specifies the rewquired dependencies which if not met cause a failure|
|Alias| Allows the unit to be enabled using other names|
|Also| Specifies addicioinal units to be enabled or disabled whtn this unit is enabled or disabled|


# cron jobs

# crontab
```text
# crontab structure

# cron jobs are checked every minute

# system crontab format
* * * * *   user-context   script

# user crontab format
* * * * *   script

# run the script backup.sh at 9:05am the 1st and 28th day of the month and every friday
5 9 1,28 * 5  /home/tux/bin/backup.sh

# run the script backup.sh at 8pm on weekdays
0 20 * * 1-5  /home/tux/bin/backup.sh

# run the script backup.sh at 8:15am every monday in the month of january
5 8 * JAN MON  /home/tux/bin/backup.sh
```

### /etc/cron.allow
- doesn't exits
- if exists, and empty, no user is allowed to use cron service
- if exists, only users listed can use the cron service
- takes precedence above cron.deny

### directories
- /etc/cron.daily
- /etc/cron.hourly
- /etc/cron.monthly
- /etc/cron.weekly
- /etc/cron.d


### nicknames
- @annually     0 0 1 1 *
- @yearly       0 0 1 1 *
- @monthly      0 0 1 * *
- @weekly       0 0 * * 0
- @daily        0 0 * * *
- @hourly       0 * * * *
- @reboot


|min|hour|day|month|day-of-week|
|-|-|-|-|-|
|0-59|0-23|1-31|1-12,jan-dec|0-6,mon-sat|



|Params| description |
|-|-|
| -e|edit|
| -r|remove|
| -l|list|
| -u|modify crontab of specific user|
| -V|print version|





# at
```bash
# atd service is not enabled by default, you enable it with this
systemctl enable --now atd.service



# start the at prompt in wich you write your script
at noon tomorrow
at 13:06
# ctrl+d to save the job and end the at prompt

# list all the at jobs
atq
at -l

# list current user scheduled jobs. user jobs are disabled for root
atq -V # more info
atq -q <x> # display jobs only in the specified queue

atrm {job-number} # remove a job from a qeue

```
- one time jobs


|Params| description |
|-|-|
| -f| specify file with job details|
| -m| send email when completed|
| -u| send emaail to specified user|
| -q <x>| place job in the specified queue valid queues are a-z and A-Z. Default is a|



# systemd-timer
```bash
# timers are managed like services with start/stop/restart/enable/disable --now
systemctl start check-battery.timer --all

# show timers
systemctl list-timers

# view contents of the timer
systemctl cat logrotate.timer

# check status of a timer
systemctl status logrotate.timer
```



## service units
- the service unit is called by the timer unit
- composed by 2 files, the timer which defines the time, and the service which defines the action
## timer units
Files with the .timer suffix in the /etc/systemd/system directory
## timer types
- Real Time:
    - OnCalendar: day, date and time
- Monotonic:
    - OnActiveSec: time after unit activation
    - OnBootSec: time after system boot
    - OnStartupSec: time after service manager starts
    - OnUnitActiveSec: time after the service was last started
    - OnUnitInactiveSec: time after the service was last deactivated



``` hello.timer

[Unit]
Description="Run hello.service every Monday at 10AM"

[Timer]
OnCalendar=Mon *-*-* 10:00:00
Unit=hello.service
```

``` hello.service

[Unit]
Description="Hello World Script from SUSE"

[Service]
ExcecStart=/bin/sh -c 'date >> /home/tux/timer_file'
```

``` boot_msg.timer

[Unit]
Description="Run hello.servide 5min after boot"

[Timer]
OnBootSec=5min
Unit=hello.service
```

``` boot

[Unit]
Description="Run hello.servide once in the future"

[Timer]
OnCalendar=2025-01-15 10:00:00
Unit=hello.service
```



# sudo
```bash
# using a single dash reintilizes the shell
newgrp {group}
sg {group} -c {command}
```




|file|contents|
|-|-|
|/etc/sudo.conf | plugins, debug flags|
|/etc/sudoers| config that affects users|


sudoers
- Defaults: default behavior, shell environtment, paths to use, logging
    - setting home directory
    - resetting the shell environment
    - environment variables to keep when resetting the shell environment
    - setting a different secure path to locate commands
    - don't insult users on wrong password
- Aliases: for group users, commands and hosts to simplify configuration
    - Host_Alias
    - User_Alias
    - Cmnd_Alias
    - Runas_Alias (user or group that a command can be run as
- Privileges: which user can run a specified command and option on which host

``` sudoers

# SLES15 has these 2 lines to make sudo act like su
Defaults targetpw   # ask for password
ALL ALL=(ALL) ALL   # allow any user on any host to run any command

Defaults always_set_home
Defaults env_reset
Defaults env_keep ="LANG LC_ADDRESS ..."
Defaults source_path="usr/sbin:/usr/bin:/sbin:/bin"
Defaults !insults
Defaults timestamp_timeout=0

Host_Alias WEBSERVERS = www1, www2, www3
User_Alias ADMINS = millert, dowdy, mikef
Cmnd_Alias PROCESSES = /usr/bin/nice, /bin/kill \
                       /usr/bin/renice, /usr/bin/pkill \
                       /usr/bin/top

# WHO WHERE = (AS_USER:AS_GROUP) WHAT
root ALL=(ALL:ALL) ALL

ADMINS WEBSERVERS=PROCESSES

# tux on all hosts can run lspci
tux ALL = /sbin/lspci

# members of wheel on all hosts as any user or group without entering password can run any command
%wheel ALL=(ALL:ALL) NOPASSWD: ALL
```


|Params| description |
|-|-|
| -h| help|
| -l| list config options apply to the current user along with commands|
| -Ul {user}| list privileges for the specified user|
| -i| lauch configured shell of the target user with its env|
| -u {user}| run as a user other than root|



# ssh



```bash

# system wide
vi /etc/ssh/sshd_config

# user specific
vi ~/.ssh/config

sudo systemctl status sshd.service
sudo systemctl status firewalld.service
ip a s

# verify fingerprint
ssh-keyscan -t ecda {host} >> ~/.ssh/known_hosts

# fingerprints are stored in ~/.ssh/known_hosts
# can be added manually or using system management like SUSE Manager
```


|param| description|
|-|-|
| -C | compress|
| -E {loggfile} | append errors to this log file instead of stderr|
| -p | port|
| -q | supress warnings|
| -v | verbose|
| -X | X11 forwarding|





``` sshd_config

# disable password authentication on ssh
PasswordAuthentication no
UsePAM no
```

```bash
# restart the ssh daemon
sudo systemctl restart sshd

# generate ssh key
# ssh-keygen -t {type} [options]
ssh-keygen -r rsa -b 4096

# transfer public key
# ssh-copy-id -i {public-key-file} {server}
ssh-copy-id -i ~/.ssh/id_rsa.pub 192.168.201.12

# ssh agent monitors all ssh requests and provides the requires the private key

# check ssh agent
ps aux | grep ssh-agent

# start ssh-agent
eval $(ssh-agent -s)
ssh-add .ssh/id_rsa



```



|option|description|
|-|-|
|AllowUsers|users allowed to login using ssh|
|DenyUsers|denies sssh login to the users listed|
|Port| port number thah sshd linsnes on (defuault: 22)|
|ListenAddress| local ip address that ssh listents on , IP_Addres:Port|
|PassworAuthentication|specifies if password authentication is allowed|
|UsePAM| enables pam authentication|


## ssh tunneling
- redirect traffic from a port in one system to another
    - local forwarding: from local to remote
        - send local vnc to a remote server
    - remote forwarding: from remote to local
        - remote server sends data through port 9000, local receives on port 80
- add encryption
- access to a service on a port that is not open through a firewall

```bash
# ssh -L {local_port}:{local_host}:{remote_port} {user}@{server}
ssh -L 5901:localhost:5901 tux@server2
```


# scp
```bash
scp {options} {source} {destination} -P {port}
scp {options} {user}@{host}:{path} {user}@{host}:{path} -P {port}
```


|Params| description |
|-|-|
| -r|recursive|
| -v|verbose|
| -q|quiet, disables progress meter, warnings, etc|
| -P|port|


# sftp


|Params| description |
|-|-|
| -r|recursive|
| -v|verbose|
| -q|quiet|


# vnc
```bash
# tigervnc
vncviwer {options} {host}:{display-number}
vncviewer 192.168.201.11:1
```

- virtual network computing
- client (initiates conection), server (receives connection and produces output)
- not secure
- yast > remote services > remote administration
    - of necessary open port on firewall
        - to restrict opening ports on interface use Firewall Details
        - by default tcp ports 5801 and 5901 are open in the firewall
    - restart to restart the Display Manager
- options
    - allow remote management with session management
        - multiple concurrent sessions
        - all applications run regardless of client connections
        - if a connections is disconnected it will reconnect to the same session
    - allow remote management without session management
        - only one concurrent session
        - session is terminated when client disconnects
    - do not allow remote management
- default port 5901
- default port for browser connection 5801



# rdp
```bash
# rdp is not installed by default in suse
zypper in xrdp yast2-rdp
```

- yast > remote administration (rdp)


# storage
- physical
- disk access (sata (serial advanced technology attachment), scsi (small computer system interface), fc, iscsi, nvme(non-volatile memory express)
- block device (block device files created for storage devices and partitions, enable os to interact)
- logical storage layer (md, dm-raid, lvm, mpio, device-mapper *btrfs)

## device naming
- disks: storage devices (spinning, ssd, san)
- udev manages the creation and removing of dev files when detected or removed

### Naming Conventions

- raw sd: sd{device-letter}: /dev/sda, /dev/sdb
- raw nvme: nvme{controller}n{device}: /dev/nvme0n1, /dev/nvme1n1
- partition sd: sd{device-letter}{partition-number}: /dev/sda1, /dev/sda2
- partition nvme: nvme{controller}n{device}p{partition-number}: /dev/nvme0n1p1, /dev/nvme0n1p2

### persistent device names

are symlinks located in /dev/disk/ and are based on identifiers, for example uuid

based on:

- /dev/disk/by-id/ : disk type, bus and address
- /dev/disk/by-label/ : file system labels
- /dev/disk/by-partuuid/ : partition uuid
- /dev/disk/by-path/ : based on bus and device address
- /dev/disk/by-uuid/ : file system uuid






# lsblk


|Params| description |
|-|-|
| -a, --all|include empty and ram devices|
| -f, --fs|display file system information|
| -o, --output|columns to display (comma separated list)|
| -O|show all available columns|


# parted
```bash

# display information for a given device
parted /dev/sda print

# create gpt partition table
parted /dev/sdd mklabel gpt

# list available block devices
parted -l
lsblk

# create partition
parted /dev/sdd mkpart primary 0% 100%

# remove partition (the partition number is obtained with the print command
parted /dev/sdd rm 1

# to delete the partition table we need to delete the first block of the device
# copies an unlimited number of zeros into the output file 'of'
dd if=/dev/zero of=/dev/sdd count=1

# show disks by uuid
ls -l /dev/disk/by-partuuid/

```






|Params| description |
|-|-|
| -l| list partition layout|
| -s, --script| do not prompt user for input|



|command| description |
|-|-|
|unit {unit}|set the unit used when displaying sizes|
|select {device}|interactively select a device to work with|
|print|display the partition table for a device|
|mklabel {label-type}|create a new partition table (label). {label-type} is typically gpt (GUID partition table)|
|mkpart {partition-type} {start} {end}|create partition at start and end|
|rm {partition-number}| delete partition|
|quit|exit from parted|

# filesystems
```bash
# create filesystem in the first partition of the device sdc, with the label data1
mkfs.ext4 -L data1 /dev/sdc1

# add label to file system
e2label /dev/sdc1 data1
tune2fs -L data1 /dev/sdc1

# add label to xfs file system
xfs_admin -L data1 /dev/sdc1

# add label to btrfs
btrfs filesystem label {device/mountpoint} {new-label}
btrfs filesystem label /dev/sdc1 data1

# read label from xfs file system
xfs_admin -l /dev/sdc1

# check and repair filesystems
fsck.ext2 /dev/sdc1

# display all mouned filesystems
mount

# list all block devices of type file system
lsblk -f

# mount table, not all ara filesystems
cat /proc/mounts    # kernel keeps track of the mounted filesystems here
cat /etc/mtab       # updated from the contens /proc/mounts. could be out of sync if the root / is mounted as read only
```


|filesystem|creation command| description|
|-|-|-|
|ext2 |mke2fs -t ext2, mkfs.ext2 |not jounal|
|ext3 |mke2fs -t ext3, mkfs.ext3 |ext2 with journal|
|ext4 |mke2fs -t ext4, mkfs.ext4 |ext3 increased file and volume sizes|
|xfs  |mke2fs -t xfs, mkfs.xfs  |high performanece and extremely large files and volume sizes|
|btrfs|mke2fs -t btrfs, mkfs.btrfs|single file system spanning multiple storage devices and snapshots|
|swap |mkswap    |swap|


VFS Virtual file system switch -> Abstraction to file system

# mount
```bash
# mount {mode} {options} {device} {mount-point}
mount -t ext4 /dev/sda1 /data
mount -t ext4 -o ro /dev/sda1 /data
```


|Params| description |
|-|-|
| -t {fs-type}| type |
| -a| mount all file systems listed on fstab|
| -o {options}| specify options such as mount as read only|



|options|description|mount|fstab|
|-|-|-|-|
|remount|can be mounted more than once | x| x|
|rw, ro|write or read only|x|x|
|sync, async|synchronous or asynchronous input and output |x|x|
|atime, noatime|access time updated or not|x|x|
|nodev, dev|interpreted as device files or not|x|x|
|noexec, execk|prohibit excecution of programs or not|x|x|
|nosuid, suid|ignore suid and sguid or not|x|x|
|noauto, auto|mount automatically or not| |x|
|nouser, user|allow user to mount or not| |x|
|defaults|rw,suid,exec,auto,nouse and sync| |x|
|relatime|update inode access time relative to modify or change time| | |


# fstab
```bash

# check for syntax errors in the fstab
mount -a



```

{1} {2} {3} {4} {5} {6}

|field|description|
|-|-|
|1|block device containing the filesystem (path or UUID)|
|2|directory to mount the block device onto|
|3|filesystem type|
|4|mount options|
|5,6|whether to use the dump backup utility and the file system check order|


# umount
```bash
# umount {options} {device/mount-point}

# check processes with open files from mount point
lsof | grep /mnt

# get info about open file
lsof {file-name}

```


|Params| description |
|-|-|
| -a, --all|unmount all mounted file systems|
| -f, --force| force unmount even if there are open files|


# df

- info for entire file system

|Params| description |
|-|-|
| -h|human readable|
| -H|human readable in powers of 10|


# du

- individual named files
- files in a directory and subdirectories

|Params| description |
|-|-|
| -h|human readable|
| -s|total size directory|






# lvm (logical volume manager
- on line volume creation and resizin
- copy-on-write snapshots
- front end to the Device Mapper (used to manage logical storage)
- generic storage abstraction engine built into the kernel
- volume group (VG) is comprised of many physical volumes (pv) physical disks/partitions/hardware raid arrays. VGs can be devided into logical volumes (lv) and are created from logical extents (le)
- when a pv is added to a vg it is subdivided into physical extents (pe) (basic unit or storage allocated)
- le are mapped 1:1 to pe, are of the same size and
- in a mirror lv the mapping would be 1:2
- types
    - linear: blocks allocated from any pv in the vg
    - striped: blocks equally distributed across multiple vg (additional performance)
    - mirrored: blocks mapped in different pvs to provide redundancy


```bash

# configuration
vi /etc/lvm/lvm.conf

# DISPLAY INFO
# cols for pvs, vgs and lvs configured in vgs_cols in lvm.conf

# pv
pvscan
pvs
pvdisplay

# vg
vgscan
vgs
vgdisplay

# lv
lvscan
lvs
lvdisplay


# STEPS FOR CREATING AND PREPARING LOGICAL VOLUMES

# create physical volume
dd if=/dev/zero of=/dev/sdb bs=512 count=2     # remove partition table from volume
pvcreate /dev/sdb /dev/sdc /dev/sdd

# create volume group using pvs
# vgcreate {vg-name} {devices}
vgcreate vg1 /dev/sdb /dev/sdc /dev/sdd

# create logical volumes
# lvcreate -L {size} {options} {vg-name}

lvcreate -L 20G -n linear_lv vg1 # linear
lvcreate -L 10G -i 3 -n striped_lv vg1

# add filesystem to the new lv
mkfs.ext4 /dev/vg1/linear_lv

# view the created logical volume
lsblk -f
lvdisplay striped_lv

# create mirrored lvm
lvcreate -L 10G -m 1 -n mirrored_lv vg1

lvdisplay -m

# extend volume group
vgextend vg1 /dev/sdd

# extend logical volume (doesn't extend the file system automatically)
# number of physical extends is found via vgdisplay {vg-name}
# lvextend -l +{number-of-physical-extends} {device}
# lvextend -L +{size} {device}
lvextend -L 30G vg1/linear_lv
resize2fs /dev/vg1/linear_lv
mount /dev/vg1/linear_lv /mnt
df -h /mnt # view size of extended volume

# view logical volume properties
lvs vg1/linear_lv

# re mount volume
mount /dev/vg1/linear_lv



# extend file system, may need unmounting of the filesystem
resize2fs # ext
xfs_growfs # xfs
btrfs filesystem resize # btrfs

# print partition info
parted /dev/sde print




# LVM SNAPSHOTS
# the param -s stands for 'snapshot'
lvcreate -s -L {size} -n {name} {source-logical-volume}


# merge snapshot
# lvconvert --mergesnapshot -i {progress-interval} {snapshot-volume}
# --merge alternative to --mergesnapshot
lvconvert --mergesnapshot -i 1 vg1/snap_lv


# to check the status of the volume (if is active)
lvdisplay /dev/vg1/linear_lv


# completing a delayed snapshot merge
# unmount both source and snapshot
# deactivate and reactivate the lv source using the -a[ctivate] param
# mount again the volume
lvchange -a n /vg1/linear_lv
lvchange -a y /vg1/linear_lv






```



lvm2-lvmetad.service
- executes vgchange --monitor y
- starts monitoring a mirroredor snapshot logical volume using the dmeventd service
lvm2-monitor.service
- metadata caching for lvm
- receives notifications from udev
- maintiais a current and consistent image of the available voulume groups


## lvm snapshots
- snapshots work at block level, and are not aware of file sistems
- snapshots contain only changed blocks after the snapshot was taken
- metadata references unchanged blocks and changed blocks
- a rollback merges the blocks found in the snapshot to the logical volume
- both the volume and it's snapshot must not have any files open to be performed immediately
- once the roll back is completed, the snapshot volume is removed


- thin pool means space is assigned on demand


# lvcreate
```bash
# lvcreate -L {size} {options} {vg-name}
lvcreate -L 10G -n linear_lv vg1

```

|Params| description |
|-|-|
| -L| size|
| -n| name|
| -i| number of stripes|
| -m| number of mirrors|




# btrfs (b-tree filesystem)

```bash

# create filesystem
mkfs.btrfs /dev/sdd

# mount btrfs
mount -t btrfs /dev/sdc /mnt

# display btrfs attached to the system
btrfs filesystem show
btrfs filesystem show {device}

# storage use
# btrfs filesystem df {path}
btrfs filesystem df /mnt

# check btrfs --readonly, --repair
btrfs check /dev/sdc

# list subvolumes in the btrfs volume and get ids
btrfs subvolume list /data5
btrfs subvolume list -p /data5  # show parent ids

# create subvolumes
btrfs subvolumem create /data5/subvol1
btrfs subvolumem create /data5/subvol1/nestsv1



# mount subvolume
mount -t btrfs -o subvolid=260 /dev/sdd /data5

# configure default subvolume
btrfs subvolume get-default /data5
btrfs subvolume set-default 260 /data5


```


- 16EiB maximum file size
- snapshots roll back and forward (uses copy on write technology)
    - new changes are not commited until the last write is successful
- subvolumes
    - minimum of one subvolume
    - root is known as FS_TREE with ID=5
    - all subvolumes use the same pool of data blocks
    - mounted in the same way other file systems are
    - multiple nested and with different options, features and quotas  than the parent,
    - key component to snapshots
    - rm -r will remove the subvolume
- data compression
- awearness of ssd and nvme storage
- storage quoatas


## btrfs commands

|command| description |
|-|-|
|subvolume|tasks related with subvolumes|
|check|verify integrity and repair if requested|
|filesystem|tasks at file system level (resizing etc.)|
|quota|manage global status of quotas|
|rescue|attemp to recover a damaged btrfs filesystem|


## mkfs.btrfs

|Params| description |
|-|-|
| -b {size}|filesystem size, if not provided the entire device is used|
| -L {label}|label|
| -f|force overwrite if an existing filesystem is detected|
| -q|print only error or warning messages|


## snapper

- provides the ability to perform rollbacks on single files or whole snapshots
- requires btrfs (recommended) or filesystem on top of LVM thint provisioned LVs
- to boot from snapshots is required SLE or newer
- each subvolume requieres a snapshot configuration
    - stored in /etc/snapper/configs/
- when sles is deployed and btrf is used for root a config is created in /etc/snapper/configs/root
- snapshot data is stored at the root of the btrfs filesystem in .snapshots/{snapshot-number}
- yast automatically creates pre and post snapshots when running it
- NOT included directories:
    - /boot/grub2/i386-pc, /boot/grub2/x86_64-efi
    - /opt
    - /srv
    - /tmp
    - /usr/local
    - /var/crash
    - /var/lib/mailman, /var/lib/named, /var/lib/pgsql
    - /var/log
    - /var/opt
    - /var/spool
- Types of snapshots
    - Timeline (turn off for root)
        - Taken Hourly
        - Last 10 daily/monthly/yearly are kept (disabled by default)
    - Whenever software is installed/updated/deleted involving libzypp (such as snapper command), creates a pre/post pair
    - Administration also creates a pre/post pair
    - Manual snapshots





```bash


# view mounted snapshots
mount | grep snapshot

# view all snapshot directories
ls -plah /.snapshots

snapper create -c timeline



# syntax
snapper {global-options} {command} {command-options} {command-arguments}
snapper create -d {description} -t {single/pre/post} --pre-number {no} --command {command}

snapper -c srv create -d "Description" -c timeline


# list snapshots, the one with an asterisk is the default subvolume and currently mounted
snapper list
snapper list --columns number,type,pre-number,description

# crete snapshots
# snapper create  -t {type} {options}
# snapper create --pre-number {number} # links post a pre snapshot
# snapper create -d {description} # snapshot description
snapper create -t pre -d "before change"
# get the number of the created snapshot
sudo snapper list # the number is 11
# <-- apply the change here
# create the post snapshot
snapper create -t post --pre-number 11 -d "after change"

# modify the description of a snapshot
snapper modify -d "New description" 11



# VIEW DIFFERENCES
snapper diff 10..11 # prints the modified files





# delete snapshot
# cannot delete snapshot 0, nor the default snapshot
# snapper delete {number}
# snapper delete {number-begin}-{number-end}
snapper delete 10-11




# list of files that are different between snapshots
snapper status num1..num2

# difference in the content of files between snapshots
snapper diff 26..0 # compare snapshot 26 with current snapshot (0)
snapper diff num1..num2 {files}

# show which files were changed
less /.snapshots/30/filelist-29.txt



# undo a change
snapper undochange num1..num2 {files}

# delete a snapshot
snapper -c config delete num|num1..num2

# view configuration
snapper get-config

# change configuration
snapper -c config set-config key1=value1 key2=value2

# create configuration
snapper -c config create-config directory


# ------------------------------------

# CREATE VOLUME FOR SNAPSHOTS
# in YaST partition volume for BtrFS, name it's mounting point, and use role 'data and ISV applications'

# create snapper configuration for specific volume
snapper -c data1 create-config /data1

# view created config
less /etc/snapper/configs/data1 # view config by name
snapper list-configs # print list of all configurations





```


``` diractory-layout
/.snapshots/
    |-1/                            // single snapshot
    |   |-snapshot/
    |   |   |-files and directories
    |   |-info.xml                  // snapshot description
    |-2/                            // pre snapshot
    |   |-snapshot/
    |   |   |-files and directories
    |   |-info.xml
    |-3/                            // post snapshot
    |   |-snapshot/
    |   |   |-files and directories
    |   |-info.xml
    |   |-filelist-2.txt            // list of changes
    |
    |-...
```





|command| description |
|-|-|
|list {options}|list snapshots|
|create {options}|create new snapshot|
|modify {options} {number}|modify, including the description|
|delete number{-number}|delete snapshots|
|status {options} number1..number2|compare|
|diff {options} number1..number2|show differences|
| | &nbsp|
|create-config {path}| |
|list-configs| |


### global params


|param| description |
|-|-|
| -c | use specified configuration|





|types| description |
|-|-|
|single|standalone|
|pre|state before changes are made|
|post|state after changes are made, is linked to a pre snapshot number|



|file| description |
|-|-|
| /etc/snapper/configs/ | stored configurations |
| /etc/sysconfig/snapper| list of snapper configurations |
| /etc/snapper/filters/*.txt | not included files (ignore) |



### create

|param| description |
|-|-|
| -c --cleanup |cleanup algorythm <br>-timeline: keeps a number of hourly, daily, monthly, weekly and yearly snapshots <br>-number: deletes old snapshots when a certain number is reached<br>-empty-pre-post: deletes pre/posts pairs with empty diffs|






``` /etc/snapper/{file}

# SUBVOLUME TO SNAPSHOT ----------------------------------

# subvolume to snapshot
SUBVOLUME-"/"

# filesystem type
FSTYPE-"btrfs"

# USER PERMISSIONS ---------------------------------------

# users and groups allowed to work with config
ALLOW_USERS-""
ALLOW_GROUPS-""

# sync users and groups from ALLOW_USERS and ALLOW_GROUPS to .snapshots directory
SYNC_ACL-"no"

# SNAPSHOT PARAMETERS ------------------------------------

# run daily number cleanup
NUMBER_CLEANUP-"yes"
# limit for number cleanup
NUMBER_MIN_AGE-"1800"
NUMBER_LIMIT-"10"
NUMBER_LIMIT_IMPORTANT'"10"

# TIME BASED SNAPSHOT CONFIGURATION

# create hourly snapshots
TIMELINE_CREATE-"no"

# cleanup hourly snapshots after some time
TIMELINE_CLEANUP-"yes"

# limits for timeline cleanup
TIMELINE_MIN_AGE-"1800"
TIMELINE_LIMIT_HOURLY-"10"
TIMELINE_LIMIT_DAILY-"10"
TIMELINE_LIMIT_MONTHLY-"10"
TIMELINE_LIMIT_YEARLY-"10"

# PRE/POST SNAPSHOT CONFIGURATION

# cleanup empty pre/post-pairs
EMPTY_PRE_POST_CLEANUP-"yes"
# limits for empty pre/post/pairs cleanup
EMPTY_PRE_POST_MIN_AGE-"1800"




```













## rolling back

```bash



# list snapshots
snapper list

# rollback to the currently loaded snapshot
# creates 2 new snapshots and sets the default subvolume
# per default the system boots from the default subvolume of the root filesystem
# rollback is only supported with btrfs
snapper rollback

# if you do not provide a number first a read-only snapshot of the default subvolume is created
# a second read-write snapshot of the current systems is created to preserve your current location and the system is set to boot from that snashot
# if


# rollback to the snapshot with id
snapper rollback {number}

# shoould reboot after
reboot







```




- a new read-only snapshot of the previos default snapshot (marked with \+) is created
- a new read-write snapshot of the current loaded snapshot (marked with \-) is created and marked as default
- in snapper list:
    - ( \* ) default snapshot booted and mounted
    - ( \- ) currently mounted non default snapshot
    - ( \+ ) default snapshot to be booted on the next boot





# system libraries

- locations
    - /lib: 32 bit libraries
    - /lib64: 64 bit libraries
- types
    - statically linked: contain all the library functions that they need to execute (complete programs)
    - dynamically linked: requiere functions from external shared libraries
- dynamic library configuration
    - /etc/ld.so.conf
    - /etc/ld.so.cache
- set other paths for executables in the environment variables:
    - $PATH
    - $LD_LIBRATY_PATH


## ldconfig

```bash
sudo ldconfig # process ld.so.conf file
ldconfig -p # display contents of ld.so.cache
```


- processes the ld.so.conf file
- creates the necessary links and cache to recently used shared libraries in ld.so.cache
- dynamic loader uses ld.so.cache to locate files that are to be dynamically loades and linked


## ldd

- check which libraries a program is using

## file

- check the type of a file


# monitoring

```bash





```


- create a baseline
    - bood log information
    - hardware information (/proc, /sys, command line utils)
    - system and process information
    - hard drive usage
- monitor:
    - boot process
    - cpu
    - memory ram
    - storage
    - network
- monitoring boot process
    - press esc during boot
    - view the content of the kernel ring buffer with dmesg
    - viee logs with journalctl -b
    - view /var/log/boot.log
- cpu
    - view configuration: cat /proc/cpuinfo
    - view host and kernel: uname -a
    - current load, users, time running
    - top
- memory
    - free
    - top
    - vmstat: virtual memory statistics
        - si and so: swap in, swap out, per second, since last boot and since last interval
        - bi and bo: blocks in, blocks out: read and write per second
- disks
    - smartctl: individual disks
    - mdadm: raid
    - iostat: io statistics
- network
    - `ip -s link show`: network and ip addresses definition
    - `ethtool -S inteface`: hardware specific settings, duplexing, frame size
    - `iptraf`: 'what's going on'
    - `ss`: replacement for netstat, more organized
- supportconfig:
    - resolve support calls faster
    - collect 95% of needed info in one place
    - shows which commands where used to create the report teach troubleshooting commands
    - organize info

### system optimization

- tools
    - used for:
        - gather information (monitoring tools)
        - digest information (tracing, analysis, and baseline tools)
        - act on the results (tuning and optimization tools)
    - varieties
        - system supplied (tools that came with the operating system)
        - homemade (scripts, mining /proc or /sys)

- tasks to apply:
    - monitoring (gathering system information)
        - hardware specifications (max realistic hardware capabilities)
    - analysis
        - using a systematic approach following known processes and practices
        - using a sugested system of investigation steps
        - knowing the tools and how to use them
        - understanding each subsystem and the effect of subsystem interactions
        - tips
            - take notes, organize them and save everything
            - automate performance tool and application tests so they can be reliably repeated after a change
            - choose tools with low impact
            - trust the tools
            - use the knowledge base of other people's experiences
            - reference the internet for information and tips (validate source if posible)
        - investigation process
            - determine the current performance baseline
            - determine the general problem
            - research the problem and what others have done befor spending a lot of time
            - start your own investigation
            - document immediately
        - tuning
            - changes system configuration toaffect performance in a positive way
            - starts with monitoring and analysis
            - is an art form as much as a science
            - is an aiterative process
            - requires ongoing monitoring and analysis
            - requiere attention in multiple areas
            - weakest link dictates performance that can be achieved
            - balanced tuning is critical to optimum performance
            - there is no way to tune for every workload on a single system
            - where to focus your attention first
                - disable any daemons you do not need
                - shutdown the gui if it is running

        - kernel tuning
            - the linux kernel allows boot-time and live tuning of its parameters
            - suse labs developers created a balanced set of default kernel configuration parameters pre tuned for general linux server workloads
            - methods of tuning:
                - /proc file system
                - the sysctl command line utility
        - performance
            - find the baseline oof normal performance under specific workloads and over different time periods

    - tuning

- applied to:
    - general system optimization
    - application specifics
    - system
        - applications
        - os
            - cpu
            - memory
            - storage
            - network


# sysstat utilities

install tools

- in YaST2 add-ons > add > dvd >
    - Development-Tools-Module
    - Legacy-Module
 - in YaST2 add-ons > Run software manager
    - View > Patterns
    - In Patterns tab select Base Development
    - click Accept
    - In Changed Packages click Continue
    - close all YaST instances
- install packages:
    - `zypper --non-interactive in bc kernel-source`






fsck -a





- `sar`: (system activity recorder) collects and saves system activity information, records ac
- `sadc`: (system activity data collector) acts as the system activity data collector
- `sa1`: collects and stores binary data in the system activity daily data file and is the front end to sadc
- `sa2`: writes a summarized daily activity report
- `sadf`: (system activity display format) displays the collected data in multiple formats for database loading or graphing
- `iostat`: reports cpu statistis and i/o statistics for devices, partitions and network file systems
- `mpstat`: reports indivifual or combined processor related statistics, how the cpu is functioning
- `isag`: (interactive system activity grapher) graphically displays the system activity data stored by sar

# sysctl

- changes tunable kernel parameters at runtime
- configuration:
    - dynamic: lost at next reboot
    - static: saved and applied at each reboot
- iotop: disk usage by processes, match processes to disk i/o
- iftop: network i/o by network connection, choose which nic to monitor
- strace: traces all system call from an application (reads, writes, memory allocations, frees, task forks)
    - the `-c` option shows a summary of count time, errors and calls
    - `-p {pid}`
    - use verbose mode to record which parameters are being passed to strace along with the results
-





# networking

```bash
lspci -D | grep Ethernet
```
### configuration files

- hostname: /etc/hostname
- hosts: /etc/hosts
- nameservers and search: /etc/resolv.conf
- network configuration: /etc/sysconfig/network/config
- routing: /etc/sysctl.d/70-yast.conf
- persistent nic names: /etc/udev/rules/d/70-persistent-net.rules
- nics config files: /etc/sysconfig/network/ifcfg-{interface-name}



### general

- basic network interface: physical with single nic (eth0)
- bond: logical with two of more physical (bond0)
    - fault tolerance
    - performance
    - load balancing
- vlan: one or many using a single nic (vlan1)
    - traffic from one is isolated from the other vlans on the same nic
- bridge: logical, above physical (layer 2)
    - allow communication betweeen
        - each virtual network interface connected to it
        - the underlying physical network interface
        - the lan

- pci bus: 0000:01:00.0 -> {pci-domain}:{pci-bus-number}:{slot-number-on-bus}.{function-number}
- physical network naming
    - traditionl (default, and defined in persistent)
        - eth# (ethernet)
        - wlan# (wifi)
    - predictable (based on type and connection to the system. not enabled by default in SLES)
        - en{p} (ethernet)
        - wl (wifi)
        - if (infiniband)
        - enabled by passing kernel parameter at boot time:
            - net.ifnames=1
- persistent names based on
    - bus id
    - mac address
    - configured in /etc/udev/rules/d/70-persistent-net.rules


# ip (linux)
```bash
# ALL MODIFICATIONS MADE WITH COMMANDS ARE NOT PERSISTANT BETWEEN BOOTS

# add address
ip addr add 172.16.201.11/24 dev eth1

# show
ip addr show
ip a s
ip a s eth1 # show status only of specific ip address

# change status
ip link set up eth1

ip link show

```


|command| description |
|-|-|
|link, l|manage link level configuration|
|address, a|manage address level configuration|
|route, r|manage routing configuration|

## flags

|flag|meaning|
|-|-|
|BROADCAST|can send a data packet to all devices on the same network|
|MULTICAST|single device can send to specific group of devices simultaneously, more efficient than broadcasting|
|LOWER_UP|status UP and a connection to another devices has been stablished (such as a switch or router)|
|LOOPBACK|only for internal system communication, packets never leave the localhost|
|PROMISC|passes all traffic it receives to the CPU, even traffic not addressed to it (packet sniffing or network monitoring)|
|NOARP|won't send/respond ARP requests to map IP to MAC addresses|
|ALLMULTI|is in all-multicast mode: receives all multicast packets on the network, not just for groups it has joined|
|POINTOPOINT|direct connection between two nodes (VPN tunnel, PPP link) where broadcast capabilities are unnecesary|
|NO-CARRIER|hardware does not detect a physical signal or connection (unplugged or other powered-off)|
|DORMANT|physically UP but waiting for event (like 802 authentication)|
|MASTER/SLAVE|in bonded or bridged interfaces|




## link
```bash
ip link show eth0
ip link set eth0 up
ip l set eth0 up
```


|command| description |
|-|-|
|show|display link config|
|set|change link config|


## address
```bash
ip address show
ip address show eth0
ip a s eth0
```


|command| description |
|-|-|
|show, s|display info|
|add, a|add addesses|
|delete, d| delete addresses|




## route
```bash
# ip link {command} {device} {options}
ip route show
ip route add default via 192.168.201.1
```


|command| description |
|-|-|
|show, s|display info|
|add, a|add routes|
|delete, d| delete route|


# ethtool
```bash
ethtool {device}

```

# network
```bash

ping {address} # usese ICMP
# one file for each physical interface and one for each logical
/etc/sysconfig/network/ifcfg-{interface-name}
```



|option| description |
|-|-|
|IPADDR|static ip address including subnet mask length|
|BOOTPROTO|boot protocol (dhcp or static)|
|STARTMODE|start automátically at boot|
|ZONE|name of the firewall zone the interface is in|



# ping

- uses ICMP to send an echo request


|param| description |
|-|-|
| -c {count}| specify number|
| -i {interval}| interval between packets|
| -D|print timestamp|
| -I {interface}|use specified interface (ip address or name can be specid)|
| -4|use only pv4|
| -6|use only pvt|


# traceroute

- uses time to live ttl in the ip packet
- attemps to elicit an icmp TIME_EXCEDED response from each router in the path to the host
- a packet is sent to the specified host with the ttl value of 1
- first system decrements the ttl to 0 and sends an ICMP error message to the source
- udp default, but can use ICMP and TCP


|param| description |
|-|-|
| -m {ttl}| maximum hops (ttl)|
| -n| do not try to resolve host names (only returns IPs, faster)|
| -4, -6| force IPv4 or IPv6|
| -I| specify ICMP|
| -T| specify TCP|


# wicked

- framework for managing network configuration (default in SLES15)
- comprised of systemd services that manage different aspects of the network
- supports ethernet, wifi
- stored in plain text files (translated internally to XML syntax)


|service|description|
|-|-|
|wickedd| main wicked service, spawns additional supplicant services<br> when enabled, the alias systemd unit network.service is created and points to wicked.service, allowing systemd to manage wicked services|
|wicked| service that manages the network interfaces|
|wicked-dhcp4, wicked-dhcp6|services that provide IPv4 and IPv6 DHCP clients|
|wicked-nanny|service that automatically bring up configured interfaces as soon as they become available|


## commands


|command|description|
|-|-|
|ifstatus {device} -o {options}|status of the current network|
|ifdown {device} -o force|stop an interface even if it is in use|
|ifup {device} -o {options}|activate preconfigured interface|


## config files

- stored in: /etc/sysconfig/network/
- nic: ifcfg-{name-of-nic}: ifcfg-eth0
- routes: ifroute-{route-name}


## routes

``` ifroute-{name}
# {1} {2} {3} {4}
default 192.168.201.1 - -
10.0.0.0/24 192.168.202.1 - -
```


|field|description|
|-|-|
|1|destination|
|2|gateway|
|3|gateway interface. A \'-\' character results in the interface with the address in field {2} being used|
|4|additional options|



## basic interfaces

``` ifcfg-eth0
IPADDR='192.168.201.11/24'
BOOTPROTO='static'
STARTMODE='auto
```

``` ifcfg-eth0 netmask
IPADDR='192.168.201.11'
NETMASK='255.255.255.0'
BOOTPROTO='dhcp'
STARTMODE='auto
```

``` ifcfg-eth0 dhcp
BOOTPROTO='dhcp'
STARTMODE='auto
```


## bond configuration

``` ifcfg-bond0
IPADDR='192.168.202.11/24'
BOOTPROTO='static'
STARTMODE='auto'
BONDING_MASTER='yes'
BONDING_SLAVE0='eth1'
BONDING_SLAVE1='eth2'
BONDING_MODULE_OPTS='mode=active-backup miimon=0'
```

``` ifcfg-eth1/ifcfg-eth2
BOOTPROTO='none'
STARTMODE='hotplug
```

## name resolution

```bash
# display hostname and ip address mapping
host {host} [{nameserver}]
nslookup {host} [{nameserver}]
# display detailed hostname to ip address mapping and dns name server information
# options: +[no]all toggles display flags, +[no]answer toggles answer section
dig {@nameserver} {options} {host} {type} {class} {query-option}
dig google.com +noall +answer
# check only for mail records
dig google.com MX

```

- common mechanisms are file (/etc/hosts) and dns
- mechanisms order is stored in /etc/nsswitch.conf
- dns servers are defined in /etc/resolv.conf
- resolv.conf can be configured with text editor or with netconfig
- hostname and ip address mapping can be displayed with


``` resolv.conf
search example.com
nameserver 192.168.201.1
```

# linux logging

```bash

# edit global configuration file
vi /etc/rsyslog.conf

# edit configuration file for daemon
vi /etc/sysconfig/syslog # options for when rsysdaemon is launched

# configuration file directory
cd /etc/rsyslog.d/
vi /etc/rsyslog.d/firewall.frule


# view binary logs
last -x {file-name}
utmpdump {file-name}
lastlog

# kernel buffer ring
dmesg -x --time-format iso | less


```



- rsyslog daemon: receiving, processing and storing log messages
    - modules gather info from various sources
    - inputs sources defined by inpur configuration directives $ModLoad {module-name}
    - can include configurations from other files with $IncludeConfig /run/rsyslog/additional-log-sockets.conf
- systemd-journald: maintains structured and indexed journals
- logrotate utility automates the archiving and deleting of the log
- supportconfig: generates an archive of all the important files for troubleshooting
- sources can be in local or remote systems
- messages can be stored in local files or forwarded to centralized system


### facilities

|keyword|definition|
|-|-|
|kern| kernel|
|user| user-level|
|mail| mail subsystem|
|daemon| system daemon|
|auth| security/authorization|
|syslog| generated by syslog|
|lpr| printer subsystem|
|news| network news|
|uucp| uucp|
|cron| cron|
|authpriv| security/authorization|
|ftp| ftp daemon|
|12-15| old/archaic facilities|
|local0-7| custom facilities|


### priorities

|level|keyword|definition|
|-|-|-|
|0|emerg|emergency: system unusable|
|1|alert|alert: check immediately|
|2|crit|critical conditions|
|3|err|error conditions|
|4|warn|warning conditions|
|5|notice|normal but significant|
|6|info|informational messages|
|7|debug|debug-level messages|


### rsyslog rules

configure to perform an action based on a filter

#### selectors

- syntax: FACILITY.PRIORITY  ACTION
- example: mail.info  /var/log/maillog

#### properties

- syntax: PROPERTY, COMPARE_OPERATION, VALUE ACTION
- example: msg, contains, "error" /var/log/errlog

#### expressions

- syntax: if EXPR then ACTION
- example: if $msg contains 'error' then /var/log/errlog


### rsyslog configuration syntax

basic: simple filter and action

```txt
mail.info  /var/log/maillog
```

advanced: allows more complex filters and actions

```txt
if prifilt("mail.info") then {
    action(type="omfile" file="/var/log/maillog")
}
```




``` /etc/rsyslog.conf

# since rsyslog V3: load input modules
# If you do not load inputs, nothing happens!
# provides --MARK-- message capability (every 1 hour)
$ModLoad immark.so $MarkMessagePeriod
3600
# provides support for local system logging (e.g. via logger
command)
$ModLoad imuxsock.so
# reduce dupplicate log messages (last message repeated n
times)
$RepeatedMsgReduction
on
# kernel logging (may be also provided by /sbin/klogd)
$ModLoad imklog.so
# Set the default permissions for all log files.
$FileOwner root $FileGroup root
$FileCreateMode 0640
$DirCreateMode 0750
$Umask 0022
# Include config generated by /etc/init.d/syslog script
$IncludeConfig /run/rsyslog/additional-log-sockets.conf
```


``` mail.frule
# emergency messages to everyone logged on (wall)
*.emerg             :omusrmsg:*

# meil messages
mail.*                      -/var/log/mail
mail.info                   -/var/log/mail.info
mail.warning                -/var/log/mail.warning
mail.err                     /var/log/mail.err

# warnings in one file
*.=warning;*.err            -/var/log/warn
*.crit                       /var/log/warn

# the rest in one file
*.*;mail.none;news.none     -/var/log/messages

# enable this if you want to keep all messages in one file
# *.*                       -/var/log/messages
```


## logger
```bash
# restart rsyslog service
systemctl restart rsyslog.service

# start monitoring the log file
tail -f /var/log/messages
tail -f /var/log/warn

# log a message from another terminal
logger "this is a test message 1"
logger -p user.crit "this is a test of user.critical message 1" # this message is written to the file indicated in an .frules file that defines rules for priorities
```


- saves a log message


|param|definition|
|-|-|
| -p {priority}| use didfferent priority than default|
| -s , --stderr | output the error message to standard error as well as input file|




## logrotate

```bash
# edit global configuration file for log ratation
vi /etc/logrotate.conf

# edit additional confifuration files
cd /etc/logrotate.d/

# rotate log file
logrotate -f -v /etc/logrotate.d/user_messages | less
```

- a systemd service and timer is created that runs logrotate daily


|param|definition|
|-|-|
| -v, --verose| show what is being done during the rotation|
| -f, --force| force the rotation even though it is not necessary|




``` /etc/logrotate.conf

# rotate dotfiles weekly
weekly

# keep 4 weeks worth of backlogs
rotate 4

# create new empty logfiles after rotating old ones
create

# use date as a suffix of the rotated file
dateext

# compress log files
compress

# compression scheme
compresscmd /usr/bin/xz
uncompresscmd /usr/bin/xzdec
```

``` /etc/logrotate.d/user_messages
/var/log/user_messages {
    compress
    daily
    rotate 7
    dateext
    missingok
    notifempty
    create
}
```





## files

- /var/log/
- messages from the current boot: /var/log/boot.msg
- messages from the boot before: /var/log/boot.omsg
- messages after kerenel initialization: /var/log/boot.log
- historical data about logins and logouts: /var/log/wtmp (view with last or utmpdump)
- failed login attemps: /var/log/btmp (view with last or utmpdump)
- details about when users last logged in: /var/log/lastlog (view with lastlog)





## rsyslog

- categorizes the data according by facility (source of the log message), and priority (severity of the log message)
- kernel buffer ring: stores log messages for the kernel and kernel modules. Has a fixed size (older messages get overwritten when it's full)

### dmesg

```bash
# show messages humand readable with dates in iso
dmesg -x --time-format iso



```


|param| description |
|-|-|
| -C, --clear| clear the ring buffer|
| -c, --read-clear| print the contents of the ring buffer and clear it|
| -w, --follow| print new messages as they are created|
| -x, --decode| human readable|
| --time-format {format}| specify different time format for the timestamp|
| --since| display messages starting at the specific time|
| --until| dispaly messages before the specific time|






# journalctl

```bash
# show all messages
journalctl

# show messages for specific units
journalctl -u sshd
journalctl -u s*

# list all systemctl list-units
systemctl list-units

# list messages of priority 'err'
journalctl -p err
journalctl -p crit
journalctl -p 1..4

```


- systemd-journald: stores and collects logging data in structured and indexed journals
- stores temporarily in /run/log/journal but can be configure to be persistent
- stored in binary format


|param| description |
|-|-|
| -u, --unit={unit,pattern}| show messages for specific unit|
| --facility={facility}| messagges for specific facilities (comma separated, indicated by name or number)|
| -p, --priority={priority}| messages with specified priority number (or range)|
| -f, --follow| acts like the tail command and prints additional entries as they appear|
| -k, --dmesg| show only kernel messages|
| -S, --since={date}| show messages since time and date|
| -U, --until ={date}| show messages until time and date|


### Configuring persistent storage for journalctl

```bash
vi /etc/systemd/journald.conf
# ... edit file ...
mkdir /var/log/journal
chown .systemd-journal /var/log/journal
chmod 2775 /var/log/journal
systemctl restart systemd-journald
```

- edit /etc/ systemd/journald.conf
- create dir /var/log/journal and give it permissions
- restart systemd journal

``` /etc/systemd/journald.conf
[Journal]
Storage=auto
#Compress=yes
#Seal=yes
```


# supportconfig

```bash
# create consolidated report
supportconfig

# unpacking the created report tarfile
tar -xJf scc_server1_240121_2047.txz
```



- is a bash script owned by the supportutils package that collects consolidated info info in a file under /var/log/, named scc_{hostname}\_{date}\_{time}
- server not familiar having issues
- a ticket with suse support is required
- a server you don't have direct access to is experiencing issues


|param| description |
|-|-|
| -F| display the available keywords used with -i and -x|
| -i {keyword}| comma separated list of feeature keywords to include|
| -x {keyword}| comma separated list of feeature keywords to exclude|
| -A| activate all functions with additional logging and full rpm verification|
| -u {uri}| upload archive to the suse support server specified in the uri|
| -r {sr_number}| include the service request number in the archive name|



# suse

- automatic handling of dependencies
- ensuring version compatibility
- verifying software integrity

## RPM

- rpm database (contains metatadata, keeps track of any files that have been changed or created since the package was installed), command line utility and .rpm packages
- informs the adminjistrator if requiered software is missing
- rpm tools can verigy that software is installed correctly
- software installation using scripts
- packages can be signed using digital signatures to verify integrity
- packages consist of:
    - compiled binaries, configuration, documentation contained in a CPIO archive
    - metadata
    - scripts to be executed during the installation and removal of the package
    - a gpg signature used to verify a package source and integrity
- compiledd rpm packages naming convention:
    - {name}-{version}-{release}.{architecture}.rpm
    - wget-1.11.8-1.1.x86_64.rpm


```bash
rpm {option} {package}

rpm -q {options} {package}
rpm -q {package-file.rpm}

# check if wget is installed
rpm -q wget

# check files owned by wget package
rpm -ql wget

# show which package owns a file
rpm -qf /usr/bin/wget

# list all files owned by an rpm package that's not installed
rpm -qpl {package-name.rpm}

# info about installed packaged
rpm -qi {package-name}

# info about NOT installed packaged
rpm -qpi {package-name.rpm}

# install package
rpm -q cdrecord

# update a package from a file
rpm -Fvh ~/Downloads/package-name.rpm

# uninstall package
rpm -evh cdrecord
```


### general options

|param| description |
|-|-|
| -q| query package metadatea in either the rpm databas or a package file|
| -i| install package|
| -U| upgrade a package (or install if it's not installed)|
| -F| upgrade (freshen) an installed package (won't install not installed)|
| -V| verify installed package (file changes) against rpm database|
| --reinstall| reinstall installed package|
| -e| erase a package|
| -v| verbose|
| -h| human (progress bar)|


### -q specific options

|param| description |
|-|-|
| -a| list all installed packages|
| -i| list package info|
| -l {package}| display list of files installed with the package|
| -f {file}| display the package name that owns the {file}|
| -p| query a package instead of the rpm database|






## Zypper

- wrapper for rpm
- keeps a history
- enables rpm caching in a local directory
- supports rollback
- supports local and remote repositories
- zipper command line, yast, package kit
- patterns are groups of packages dedicated to certain purupose, for example apache2 web server
- products containt 1 or more patterns, represent a specific release with it's own features and support life cycle
- gpg check verifies integrity of packages





```bash

# edit repositories
# repos contain name, enabled, autorefresh and baseurl
cd /etc/zypp/repos.d
cat /etc/zypp/repos.d/{file.repo}

# add repositories
zypper ar {options} {uri} {alias}
zypper addrepo {options} {uri} {alias}
zypper ar http://192.168.201.2/sles17/CD1\ sles15

# list repositories
zypper lr

# remove repo
zypper rr {options} {alias/name/#/uri}

# enable repo
zypper mr -e SLES15-SP5-15.5

# search packages from repository
zypper se -r 5
zypper se wget
zypper se -t pattern {search-string}

# rename alias
zypper nr Python Python3_Module

# rename name
#zypper mr --name {new-repo-name} {repo-number}
zypper mr --name SLE-Module-Python3 5

# remove repo
zypper rr 5
zypper clean

# view status
zypper if wget
zypper info -t pattern mail_server

# install package
zypper in apache2
zypper in -t pattern games

# install package
zypper up vim

# remove package zipper
zypper rm -tD pattern games # dry run remo


```

### subcommands

|param| description |
|-|-|
| lr| list repositories|
| ar, addrepo| add repo|
| rr, removerepo| remove repo|
| mr, modifyrepo| modify repo|
| ref {repo-number}| refresh repository|
| se, search| search repo|
| nr| rename repo alias|
| mr| rename repo name|
| if, info| info about packages|
| in, install| install|
| lu, list-updates| display available software updates|
| up, update| update newest available version|
| rm, remove| remove package|




### general parameters

|param| description |
|-|-|
| -h| help|
| -v| verbose|
| -n| non-interactive mode|
| -q| suppress normal output|
| -y| non-interactive mode|
| -D| dry run|

### rm parameters

|param| description |
|-|-|





### up parameters

|param| description |
|-|-|
| -r {alias/name/#/uri}| only from specified repo|


### lu parameters


|param| description |
|-|-|
| -r {alias/name/#/uri}| only display updates in the specified repository|
| -a| display all update, even for not installed packages|


### in parameters

|param| description |
|-|-|
| -f| force. reinstall or downgrade package|
| --oldpackage| replace newer item with older one|
| -d| download packages to local cache but don't install them|


### ar parameters

|param| description |
|-|-|
| -d| add repo and disable it|
| -f| enable auto refresh (disable by default)|
| -p| set priority or repo|


### mr parameters


|param| description |
|-|-|
| -e| enable repo|
| -d| disable repo|
| -f| enable autorefresh|
| -F| disable autorefresh|
| -a| apply to all repos|
| -l| apply to local repos|
| -r| apply to all remote repos (http, https, ftp)|


### se parameters


|param| description |
|-|-|
| -r {alias/name/#/uri}| search specified repos|
| -C| case sensitive|
| -x| exact match|
| -i| show only installed|
| -u| show only packages not installed|


# yast
```bash
# partitioner
yast2 disk
# network settings

```


hiperconvergencia: significa que hay muchos caminos para llegar a un solo punto, tener hasta 2 puntos de fallo en todos los componentes

zil cache de lectura, guarda los 1000 archivos más demanadados del arreglo


JBOD y IT-MODE son lo mismo

JBOD (lenovo)
just a bunch of disk drives

IT MODE
initiator-target mode
pass through, permite al sistema operativo

"ve los discos de manera directa, sin arreglo







en el caso de las san en proxmox todo se tiene que hacer por línea de comandos,
se requiere multipath, grupo de volumenes, se usan wwns


iscsi es scsi pero por ethernet (y alternativa a FC)

switches san implica que tienes un millon de pesos



$


almacenamiento




según el tipo de storage se usa para cosas distintas


snippet:

lvm es default para sans







ext4 es más rápido que el zfs si tienes una controladora


revisar arreglo tipo 0 o modo mirror

zfs raid1 es modo mirror


2 maneras de instalar:
- controladora física del servidor haciendo el mirror, usando el filesystem ext4
- si no hay controladora raid2


single disk: cuando



ext3 como ntfs 1 de windows, sin journaling
ext4 journaling de 3 o 4 movimientos


un giga un millon de archivos, pero si se hace journaling se multiplique, hasta 10 veces más grande



xfs NO RECOMENDADO

journaling es una bitácora de movimientos de los archivos
de tal fecha a tal fecha el archivo ocupaba de tal bit a tal bit, pero cambiós


zfs es un journaling con esteroides

raid0 solo junta el espacio de los discos duros (no los está respaldando)
raid1 mirror de un disco en el otro al instante
raid10 suma del 1 y el 0 4 discos mínimo


a partir de 4 discos duros sean sólidos o mecánicos

por ejemplo 4 discos de 20TB,




80

z1 60
z2 40 (quedaría como 35TB si se tuvieran 4 discos duros de 18)
z3 20 (a menos que tengas arreglos de muchísimos discos duros como 12), mucha paranoia


dos discos duros dedicados al systema operativo para que no afecte al performance del pool de la máquinas



# fdisk



# setfacl
```bash
# set acl permissions for user for directory recursively
sudo setfacl -R -m u:{username}:{permissionsbits} {dir}

# remove acl permissions recursively for group for directory
sudo setfacl -R -x g:{username} {dir}

# check acl permissions for file
sudo getfacl {file-or-dir}

```


|Params| description |
|-|-|
| -m | modify|
| -x | remove|
| -d | default|
| -b | remove all|
| -R | recursive|
| -n | do not reevaluate the mask|


# ps pgrep

```bash
# check process with string
ps aux | grep -i {process-name} | grep -v grep

# print processes with (n)ice value, (p)id and (c)ommand
ps -o %n\ %p\ %c



# show proceses formatted
ps -eo pid,user,cmd

# grep processes but adding a table header
ps aux | head -n 1 ; ps aux | grep vi
ps -fea



pkill {process-name}
kill {process-id}

# other commands
pstree
pgrep
```


|symbol| type | description |
|-|-|-|
|R| running/runnable | receiving or waiting for cpu cycles |
|S| sleeping interruptible | waiting for signal or something to wake it up |
|D| sleeping uninterruptible | ignores signals |
|T| stopped | from R, can be restarted with a signal |
|Z| zombie | terminated and releasing resources. parent must remove it from process list |



|Params| description |
|-|-|
| -e | all processes|
| -f | full format|
| -l | long listing (additional columns)|
| -H | hierarchy in tree view|
| -L | individual threads|
| -o | pid,tid,euid,pgrp format (comma separated list of items)|
| a | all processes|
| u | user orientated format|
| x | include processes without tty |
| f | process tree|
| o | format for the output|
| k | sort order of the input|
| --format | format for the output|
| --forest | tree view|
| --no-headers | no header lines|
| --sort | specify the sorting order|


# kill

- sends a signal to a process by PID
- without arguments it sends a SIGTERM by default


|Params| description |
|-|-|
| -s <signame>|send signal|
| -<signumber>|send signal|
| -l|list available signals|



# killall

- sends a signal to processes with specific name
- without number it sends a SIGTERM by default


|Params| description |
|-|-|
| -<signumber>|send signal|
| -I|case insensitive|
| -i|interactive, asks for confirmation|
| -u <username>|signal only processes that the usere owns|
| -w|wait for processes to die, (may be forever if the process does not respond|



# pkill

- is like pgrep
- sends a signal to each process by name
- without arguments it sends a SIGTERM by default


|Params| description |
|-|-|
| -<signumber>|send signal|
| -r <run-state>|match only processes in the specified runstate (D,R,S,Z)|
| -i|case insesitive|




## signals

```bash
kill
killall
pkill
```

- another process
- root process
- owner


|signal|name|description|
|-|-|-|
|1|SIGHUP|reload config|
|2|SIGNINT|interrupt from keyboard ctrl+c|
|9|SIGKILL|kill the process immediately|
|15|SIGTERM|request process to terminate|
|18|SIGCNT|move stopped process to running (continue)|
|19|SIGSTOP|stop a process|




# pstree

|Params| description |
|-|-|
| -a|show command arguments of the process|
| -g|show process group identifiers|
| -h|highlight current process and ancestors|
| -n|sort by PID instead of name|
| -p|display PID|
| -c| disable compactation of identical branches|


# pgrep


|Params| description |
|-|-|
| -u|specific effective users|
| -U|specific actual users|
| -l|list names along with PID|
| -a|show command arguments|
| -r|list with state (D,R,S,Z,etc)|
| -i|case insensitive|
| -o|oldest|


# nice
- run command with nice value

```bash
nice -n +5 firefox &
```


|Params| description |
|-|-|
| -n increment|20 to -19 value|


# renice
- change nice value

|Params| description |
|-|-|
| -n <increment>|20 to -19 value|
| -p <PID>|process|
| -u <username/UID>|user|


# jobs
- the + sign indicates that is the default job for fg
- [id]{+|-} {status} {command-with-arguments}

|Params| description |
|-|-|
| -l| include PIDs|
| -p| only PIDs|
| -r| only running|
| -s| only stopped|


# bg
- starts a background job that is currently stopped



# special bash variables




|variable| description|
|-|-|
|$0|name of the script of shell being executed|
|$#|number of arguments|
|$*| all arguments in a single string|
|$1 - $9| arguments by position|
|$?| last exit code|
|$$| pid of current shell|
|$!| pid of last background command|
|$_| last argument of previous command|
|$IFS| internal field separator|



# Tmux
```bash
tmux new -s session-name
tmux attach -t session-name
```


|char| action|
|-|-|
| & | kill window|
| x | kill pane|
| % | split horizontal|
| ? | show shortcuts|
| " | split vertical|
| arrow | navigate between splits|
| }{ | move pane|
| ! | turn pane into a window|


---


|command| action|
|-|-|
|list-keys | show keybindings|



# BSD
## Partition commands

|command| action |
|-|-|
| p g | disk space|
| a | add partition|
| w | write changes|
| q | quit partition creator|


---


|description | directory | size|
|-|-|-|
|root | / | 2GB|
|swap | --- | RAM x 2|
|temp | /tmp | RAM x 2|
|programs | /usr | 28GB (under consideration)|
|var | /var | 700GB (under consideration)|
|logs | /var/log | 10GB|
|hiawatha | /var/www/logs | 10GB|
|home | /home | Restante|

\* en linux a veces usan opt en vez de var



# brew

```bash
# only show packages without dependencies
brew leaves

# only update specific package
brew upgrade {package-name}
```


# oracle
```bash
# connection strings
vi /etc/oratab
# {nombre-db}:{ubicación-config}:{N indica que se monta al inicio del sistema}

# connection strings
vi {configuration-path}/tnsnames.ora
```


# Network
```bash

# show physical nics
lspci | grep -E -i --color 'network|ethernet'

# show all iptables rules for specific table
ss -tuln iptables -t {table} -vL

# listenin ports
doas netstat -na -f inet inet | grep LISTEN

# restart webservice
systemctl restart NetworkManager.service
```


|command|action|
|-|-|
| tracert, traceroute, tracepath | route packets take to host|
| netstat -tuplen | ver ip tables|
| netstat -rn / route -n | manipulating and showing ip routing table|
| telnet {server} 80 | ver si es accesible desde afuera el puerto 80|
| lsof -i -P -n | list open ports|
| ifconfig | configuration of network|
| ip link show, ip a | check nics|
| dig | dns lookup|
| ethtool | dns lookup|
| nmcli con show | show all available connections|
| ifup/ifdown| enable/disable nic|
| ip address | configuration of network|
| nslookop | check if domain resolves to a ip address|







( doas pkill hiawatha ; doas hiawatha ) → reinicio de hiawatha
( sudo systemctl restart mysql ) → restart mysql
( hostnamectl command ) → Display host name and Linux distro info on systemd based distros.
( /etc/sysconfig/network-scripts/ifcg-{device-name} ) → software interface for network device
/etc/systemd/system/some_target.target.wants -> autostart files (services) sudo rm /etc/systemd/system/nginx.service remove service unit
( pkg_delete ) → remove installed package
( /etc/pkg.conf ) → package repository
yum install samba samba-client samba-common




# suse linux enterprise

- press e on boot screen in the snapshots menu to view more info about the snapshot





|command|action|
|-|-|
| lsmod | list of current loaded kernel modules|
| man -k {keyword} | search manpages and section using keyword|
| apropos {keyword} | search manpages using keyword|
| whatis | description in one line|
| man {section} {command} | view man page section|
| info | navigate manpages in tree format (suse, requires emacs)|
| !{history} | execute command in history|
| pwd -P | physical directory|
| tree -L {level} | show directories in tree format|
| tree -f | path prefix|
| pushd | |
| popd | |


# cp
|param|action|
|-|-|
| -p | keep permissions, owner and timestamps|
| -i | confirm overwriting|
| -n | do not overwrite|
| -u | copy only if source is newer|



# mv
|param|action|
|-|-|
| -i | confirm overwriting|
| -f | do not prompt if destination exists|
| -n | do not overwrite|
| -u | copy only if source is newer|



mkdir -p - create parent directories
rm -i force confirmation for deletion
rm -f force no confirmation

stat {filename}  file info


# samba
```bash
# edit samba config
vi /etc/samba/smb.conf

# restart samba services
systemctl restart smb
systemctl restart nmb
```

head -n

diskutil list ) → list volumes macos

# system info
```bash
lscpu       # list processors linux
lsblk       # list block volumes linux
lsof        # list open files
lsof | grep {volume}    # list processes using volume
```

# filesystem
```bash
# view mounted volumes
mount

# directories available for mounting from another ip
/etc/exports ) → indica qué directorios son son accesibles para ser montados desde otra ip

# exports table estructure:
# {directorio}    {ip 1}(rw,sync) {ip 2}(rw, sync) ...

# view partitions of mounted volume
fdisk {mount-point}

# fdisk commands
# p - print dir structure
# q - quit
```









cambiar cosas que se hacen en passwd también en shadow
añadir /bin/bash al usuario en passwd o en group?

( /etc/{sudoers, passwd, shadow, group, gshadow, *-release} ) → users, groups, distro
( /proc/{mounts, version, cpuinfo} ) → disks, kernel, cpus bsd linux
( /home ) → user home folders bsd linux
( /Users ) → user home folders macos
( id ) → id user, group
( uname -a ) → os
( free -m ) → ram
( adduser ) → create user higher level script
( useradd ) →create user linux

Redhat
( tally files: faillock ) → display/modify authentication failure record files
pam_tally2 --user=isis --reset faillock --user isis --reset useradd -c "Info detalle Oracle - CONSAR" isis -d /dminftab1/isis -s /bin/bash -u 140 -g 115

( chage --maxdays -1 {username} ) → remove password expiration date
( user mod -a -G {group} {user} ) → add user group bsd
( usermod -a -G {group} {user} ) → add user group linux
( gpasswd -d {user} {group} ) → remove user from group
( passwd ) → change password
( dscl . append /Group/group {group} {user}) → add user group macos
( lsb_release command ) → distro info linux
( lsof | grep {volume} ) → process locking the volume macos
( dmesg ) → system message buffer
( chflags -h hidden {symlink} ) → hide symling in finder macos bsd
( openssl {mdf5/sha1/etc} {filename} ) → get checksum of file
( systemctl restart mysql ) → restart mysql
( echo 'PermitRootLogin yes' > /etc/ssh/ssh_config ) → permitir login remoto como root
( echo 'AllowUsers {user-names}' > /etc/ssh/ssh_config ) → permitir ssh únicamente a los user-names específicos
( launchd ) → system wide daemon manager macos
( launchctl ) → interface with launchd macos
( service {service-name} status ) → interface with launchd macos
( kbd -l ) → list keyboard layouts bsd
( du -h -d 2 | sort -h ) → dir size
( exportfs -arv ) → selectively export or unexport directories without restarting the NFS service
( ln -s /usr/local/bin/{package} /var/www/bin/ ) → make package accessible to www
( dd if=image.iso of=/dev/{drive} bs=4M status=progres ) → Burn iso image

firewall-cmd
--------------------

( --get-active-zones) → current zone
( --zone=public --list-all) → list all rules of zone
( --zone=public --remove-service=service) → remove service
( --zone=public --add-source=192.168.240.103) → add ip to zone
( --zone=public --add-source=192.168.255.0/24) → add ip segment to zone
( --zone=public --add-rich-rule='rule family=ipv4 service name=ssh log prefix="Dropped SSH" level="notice" limit value=1/m drop') → add ip to zone
( /var/log/messages) → firewall messages


# PROXMOX

```bash
# ingresar a contenedor
pct enter {id-container}
```


## Add free repository

- access the proxmox server via terminal
- navigate to the apt repositories directory
    - `cd /etc/apt/sources.list.d`
- edit the `pmg-enterprise.sources` file and comment the url inside it
- create another repository file called `proxmox.sources` and add a source from the manual
    - [manual](https://pmg.proxmox.com/pmg-docs/pmg-admin-guide.html#pmg_package_repositories)





( qm )
------
qm unlock es para desbloquear maquina con el id
qm stop para apagar la máquina
qm list dice los ids de las máquinas que existen
vmdiscs los qcow2 son las discos de las  máquinas

Consideraciones
---------------
- Debian - instar con el cable de red desenchufado
- La swap debe de ser del doble de la memoria RAM que se le asigne a la VM
- Un core físico de Proxmox puede soportar 6 cores virtuales
- Para BSD y Linux usar iSCSI







# macos

|command | action|
|-|-|
|pbcopy | copy to clipboard|
|mdfind | spotlight|



```bash
scp {user}@{host}:{remote-file} {destination} -P {port}
cat ~/.ssh/id_rsa.pub | ssh {user}@{host} -p {port} 'cat >> ~/.ssh/authorized_keys'
sshfs {user}@{host}:{directory} -o port={port}
```


|command|action|
|-|-|
| ln -s {source} {target} | symlinks|
| tar -xvf {filename}  | extract|
| tar -czvf {filename} {data}  | compress|
| fswatch -xr {directory} | watch directory changes|
| watch  | exec program periodically fullscreen|
| diff  | diff -q dir-1/ dir-2/|
| expr  | calculate math expressions|
| tty  | name of the terminal|
| sync  | synchronizes cached data to permanent storage.|
| wait4path  | sleeps until path exists|


# grep
```bash
# bsd grep
grep -irwn 'string' 'absolute-path'
grep {flags} {regex} {location pattern}
grep -r --include \*.php "TEXTO"
```


|param|description|
|-|-|
| -r | recursive directory|
| -i | case insensitive|
| -n | line number|
| -c | count occurrences|
| --include | especifica qué archivos revisar, se pone un --include por cada pattern|



# find
```bash
find {location} -type f/d -name {regex}

# encuentra archivos con STRING (gnu grep)
find . -name "*.php" -exec grep "STRING" {} \;
```


|param|description|
|-|-|
| -P | never follow symlinks|
| -L | follow symlinks|
| -D | debug|
| -o | or|
| -a | and|
| -n | print line number|
| -empty | if file is empty (check man for test)|
| -exec | execute command|
| \; | execute command for each file|
| \+ | concatenate all find results and execute command for that resulting line|
| {} | placeholder for find results|



# fzf
```bash
# preview file using program, for example cat or bat
fzf --preview="bat --color=always {}
```


# awk
```bash
#  show fields 1 and 2 of the rows in which field 3 is smaller than 50
awk -F, '$3 < 50 {print $1, $2}' data.csv
```


# VIM commands
```bash
# open files and compare them
vimdiff / vim -d

# edit user's config file
nvim ~/.vimrc

# edit global config file
nvim /etc/vimrc
```


| command | description |
|-|-|
|:diffthis| diff two current buffers|
|:diffoff| stop diffthis|
|:set all | show configured options (:set! one per line)|
|:set {option}? | show  value of a setting|
|:let  | show options set using variables|
|:set | show only changed options|
|:help| |
|:vimtutor| |
|:reg | view registers|
|:buffers/ls/files | show all open buffers|
|:(v)new {filename} | new window  |
|:(v)split horizontal | split |
|:marks | |
|:ju\[mps\] | |
|:changes | |
| :sav | save as|
| :w !sudo tee % | save file with sudo|
| :!chmod +w % | make file writeable|
| :LspInfo | info de los servidores de lenguajes|

---

| shortcut | action |
|-|-|
| ^w | windows (s:split, w:switch, q:quit, v:split)|
| gwip | paragraph to 1 line|

---

| shortcut | navigation |
|-|-|
| ma | mark a|
| \`a | jump to a|
| y\`a | yank to a|
| \`0 | jump to where closed|
| \`= | jump to last edited|
| \`. | jump to last change|
| \`\` | jump to last jump|
| \`= | jump to last edited|
| ^i | jump forward|
| ^o | jump backwards|
| g, | go to newer changes|
| g; | go to older changes|
| ^\[ | quickfix next|
| ^\] | quickfix prev|
| gd | local declaration|
| gD | global declaration|
| ge_ | last non-blank char|
| \_c | quickfix open|

---

|shortcut|action|
|-|-|
| d | new dir|
| a | hidden files|
| c | set current dir|
| gh | toggle dot files|
| r | reverse sorting|
| s | sorting type|
| S | sort by suffix/prefix|
| X | execute file|
| i | tree view|
| mt | assign target|
| mf | mark file|
| mc | copy files in the target|
| mm | move files to the target|
| mx | run external command|

---

|shortcut|vim-surround|
|-|-|
| cs{sur}{new} | change surround to new|
| ds{sur} | delete surround|
| ys{i/a}{element} | surround inside or around element|
| yss{sur} | surround line|
| S{sur} | surround visual mode|

---

# custom nvim

|shortcut|description|
|-|-|
|alt+[ | quickfix prev |
|alt+] | quickfix next |
|alt+j | buffer prev |
|alt+k | buffer next |
|alt+l | buffer toggle |
| leader+i | lsp info|
| leader+m | toggle marks|
| leader+c | toggle quickfix|
| leader+u | toggle undo |
| leader+D | force buffer delete |
| leader+d | toggle markdown rendering|
| leader+9 | code folding |
| leader+z | remove ^M newline chars |
| leader+) | clear quickfix |
| ctrl+q | send contents from telescope to quickfix|
| zi | zoom in nvim panel |
| zo | zoom out nvim panel |
| zx | swap panels |
| ps | document symbols|
| pf | project files|
| pd | project files including hidden|
| pb | buffers|
| pw | grep string|
| pr | live grep|
| pd | all files|
| pl | tmuxifier templates|


# custom tmux

|shortcut|telescope|
|-|-|
|q | pane numbers|
|y | sync panes|
|h | layout horizontal|
|v | layout vertical|
|f1-f4 | switch windows|
|f11 | show cheatsheet|
|cmd+j | session prev |
|cmd+k | session next |
|cmd+l | session toggle |
|cmd+z | zoom pane|
---

|shortcut|lsp|
|-|-|
| K | definition help hover|
| \_vws | vim.lsp.buf.workspace_symbol()|
| \_vd | vim.diagnostic.open_float()|
| \[d | vim.diagnostic.goto_next()|
| \]d | vim.diagnostic.goto_prev()|
| \_vca | vim.lsp.buf.code_action()|
| \_vrr | vim.lsp.buf.references()|
| \_vrn | vim.lsp.buf.rename()|
| ^s | vim.lsp.buf.signature_help()|

---

|shortcut|comment|
|-|-|
| gcc | comment line|
| gc{motion} | comment motion|



# vim search

|symbol|description|
|-|-|
| . | Current line|
| $ | line|
| % | Whole file|
| x | Line number x|
| .,+x | From current until x lines|
| 't | position of mark "t"|
| \/ | next line previous search matches|
| \? | prev line previous search matches|
| \& | next line previous substitute matches|

---

|command|description|
|-|-|
| /\v | use nonalpha as regex|
| :vim\[grep\]/pattern/{\`{file}\`} | find in files|
| :cn\[ext\] | next match|
| :cp\[rev\] | prev match|
| :cope\[n\] | list matches|
| :cll\[ose\] | close quickfix view|
| :noh\[lsearch\] |remove highlight|

---

|symbol|flags|
|-|-|
| i/I | case|
| c | confirm each|

---

|command|replace with HI|
|-|-|
|y | yes|
|n | no|
| a | all|
| q | quit no substituting not undo|
| l | substitute this and exit|
| ^E | scroll up|
| ^Y | scroll down|

---

|command|regex|
|-|-|
| \\+ | 1 or more|
| \\= | 0 or 1 more|
| \\{n,m} | from n to m|
| \\{n} | exactly n times|
| \\{,m} | from 0 to m|
| \\{n,} | at least n|
| \\{-} | 0 or more (non-greedy)|
| \\{-n,m} | 1 or more (ng)|
| \\{-n,} | at lease or more (ng)|
| \\{-,m} | 1 or more (ng)|

---

|command|grouping & backreferences|
|-|-|
| & | whole matched pattern|
| \\L | following characters are made lowercase|
| \\0 | whole matched pattern|
| \\U | following characters are made uppercase|
| \\E | end of \U and \L|
| \\e | end of \U and \L|
| \\l | next character made lowercase|
| ~ | previous substitute string|
| \u | next character made uppercase|

---

|shortcut | insert mode|
|-|-|
| ^w | delete word|
| ^t | tab|
| ^d | de-indent|

---

|shortcut | visual mode|
|-|-|
| o | start/end selection|
| ~ | switch case|
| ^a | increment numbers|
| ^x | decrement numbers|
| >i\{ | Increase inner block indent|
| =2a\{ | Re-indent '2 blocks'|
| \]p | Paste match indent|
| % | \{\} or \[\]|
| p | paragraph|



# network layers

| layer | name | description |
|-|-|-|
|7 | Application | Human/computer interaction layer, where applicationscan access the network services|
|6 | Presentation | Ensures that data is in an usable format and is where data encryption occurs|
|5 | Session | Maintains connections and is responsible for controlling ports and sessions|
|4 | Transport | Transmits data using transmission protocols including TCP and UDP|
|3 | Network | Decides which physical path the data will take|
|2 | Data Link | Defines the format of data on the network|
|1 | Physical | Transmits raw bit stream over the physical medium|










sandoxIP
---------

10.0.1.50 prettyhatemachine



# ports

|number|service|
|-|-|
|22| ssh|








# Linux Enterprise server

## YaST security hardening module

YaST Control Center > Security and Users > Security Center and Hardening

- Login procedure
- Password creation
- Boot permissions
- User creation
- Defaault file permission

```bash

# view entries for YaST adjustments
ls /etc/systemd/system

```







zabbix-agent




pbs 10.0.1.19:8007


# Pulse Proxmox

usr:sandox
729


10.0.1.45:7655
https://github.com/rcourtman/Pulse






