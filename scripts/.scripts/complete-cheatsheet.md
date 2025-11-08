

```bash
# restart php
doas /etc/rc.d/php56_fpm restart

# restart mysql
sudo systemctl restart mysql

```


# applayer

|key|Action|
|-|-|
|=|Karabiner|
|2|cycle layouts|
|3|float window|
|4|fullscreen|
|5|main window|
|0|opacity on focus|
|-|mouse focus|
|r|layout conference|
|t|layout terminal|
|~|eject|
|1| |
| \ | |
|a| |
|s| |
|g| |
|x| |
|c| |







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


# ps, kill, pkill
```bash
# check process with string
ps aux | grep -i {process-name} | grep -v grep

# show proceses formatted
ps -eo pid,user,cmd

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
| -l | additional columns|
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







( doas pkill hiawatha ; doas hiawatha ) → reinicio de hiawatha
( sudo systemctl restart mysql ) → restart mysql
( hostnamectl command ) → Display host name and Linux distro info on systemd based distros.
( /etc/sysconfig/network-scripts/ifcg-{device-name} ) → software interface for network device
/etc/systemd/system/some_target.target.wants -> autostart files (services) sudo rm /etc/systemd/system/nginx.service remove service unit
( pkg_delete ) → remove installed package
( /etc/pkg.conf ) → package repository
yum install samba samba-client samba-common




# suse linux enterprise







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




head -n


( lscpu ) → list processors linux
( lsblk ) → list block volumes linux
( diskutil list ) → list volumes macos
( mount ) → mounted volumes
( lsof ) → list open files macos
( lsof | grep {volume} ) → process using volume
( vipw ) → edit group related files locking them
( samba ) → edit samba config
(
    vi /etc/samba/smb.conf
    systemctl restart smb
    systemctl restart nmb
)
( /etc/exports ) → indica qué directorios son son accesibles para ser montados desde otra ip
    {directorio}    {ip 1}(rw,sync) {ip 2}(rw, sync) ...
( fdisk {punto-de-montaje} ) → particiones
    (p - permite imprimir la estructura de las particiones del volumen montado)
    (q - salir)


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

|shortcut|telescope|
|-|-|
| ^q | from telescope, send to quickfix list|
| ps | document symbols|
| pf | project files|
| pd | project files including hidden|
| pb | buffers|
| pw | grep string|
| pr | live grep|
| pd | all files|
| pl | tmuxifier templates|

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


