


```bash
# like who but more detailed
w


# restart php
doas /etc/rc.d/php56_fpm restart

# restart mysql
sudo systemctl restart mysql
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
|g| | '| windows app |
| | &nbsp | | |
| | &nbsp | | |
| left_shift  | eyedropper |n| office |
|z| finder | m| conference |
|x|   |,| clipboard |
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

- System monitor
-






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


PROXMOX
-------

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










IP
---------

10.0.1.50 prettyhatemachine



# ports

|number|service|
|-|-|
|22| ssh|






zabbix-agent
