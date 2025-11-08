


( ps | grep vi | grep -v grep ) → check process ignore grep
doas /etc/rc.d/php56_fpm restart
sudo systemctl restart mysql


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



# VIM CONFIG
| | |
|-|-|
|:set all | show configured options (:set! one per line)|
|:set {option}? | show  value of a setting|
|:let  | show options set using variables|
|:set | show only changed options|


vim configuration is stored in
~→/.vimrc
/etc/vimrc

setting options
echo 'set number' >> ~/.vimrc


:help
:vimtutor
:reg → view registers
:buffers/ls/files → show all open buffers

:(v)ne→w {filename} new window
:(v)split horizontal split

c → confirm change


( vimdiff / vim -d ) → open files and compare them
( vimtutor ) → ver














|Symbol|Filetype|
|-|-|
|-| regular files (data)|
|d| directory (metadata)|
|b| block device|
|c| character device|
|p| pipe device|
|s| socket device|
|l| symlink|




inode is the metadata



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
|Params| |
|-|-|
| -g {group} | change primary group |
| -G {groups} | change or add suplementary groups|
| -a | add-suplementary-group |
| -l {name} | change login name |
| -L  | lock account|
| -U  | unlock account|
| -e {date} | expiration date |


( userdel )
-r remove user's home directory and mail spool
-f force -r but even if the user is logged in

( groupadd {groupnaame} )
-g set group id
-r create group id in the system group id range

( groupmod {groupname} )
-g change group id
-n change the name of the group

( groupdel {groupname} )

( passwd {username} )
-d → delete account password
-e → expire passwdor immediately
-l → (lock) disable account access using a password
-u → (unlock) enable account access using a password
-w {days} → display a warning {days} before the password expires

shadow
{1}:{2}:{3}:{4}:{5}:{6}:{7}:
1 username
2 encrypted password
3 date of last change
4 minimum days between changes
5 days password is valid
6 grace days
7 date of expiration (lock)

chage change password dates
-l view password info
-E set expiration date
-I days of inactivity after expiration before locking the account
-m minimum days before a password change
-M maximum days password will be valid
-d change date of last password change
-w set password expiration warning days

chage -l {username}
chage -M {days} {username}
chage -E -1 {username}
chage -E {YY-mm-d} {username}
chage -E {YY-mm-d} {username}

fully lock the account
chage -M {days} {username}
usermod -L {username}
chage -E 0 {username} → expires the account



directory
r viewed
w contents can be modified and deleted
x enter the directory

order: uid || gid || other


Standard ACLs: users, groups, other
Extended ACLs: individual groups and users (same as the standard (rwx) in addition to the owner


getfacl and setfacl are in the package 'acl'


( sudo setfacl -R -m u:{username}:{permissionsbits} {dir} ) → set acl permissions for user for directory recursively
( sudo setfacl -R -x u:{username} {dir} ) → remove acl permissions recursively for user for directory
( sudo getfacl {file-or-dir} ) → check acl permissions for file


umask - defines dthe default permissions assigned to newly created files and directories



getfacl
-a displya only the file access control list component
-d display only the default access control list component
-R liste the ACLs of all files and directories recursively

acl are marked with a + beside the standard permissions

acl mask
- if a permission is specified in the acl mask it is allowed
- acl mask applies to named users and all groups
- acl mask is not applied to the file owner and other

tune2fs
- sets or list s parameters for file system


setfacl
-m modify
-x remove
-d default
-b remove all
-R recursive
-n do not reevaluate the mask

getfacl




R running:
    running - currently receiving cpu cycles
    runnable - waiting in the queue to receive cpu cycles
Sleeping
    waiting for a particular condition, for example a request to acces external resources
S sleeping interruptible
    wakes up when a signal is received or something wakes it up
D sleeping uninterruptible
    ignore signals
T stopped
    from running or runnable
    stopped and restarted with a signal
Z zombie
    terminated and in the process of releasing resources
    remains a zombie until the parent processs removes it from the process list


option types
- unix (grouped, with a dash), bsd (grouped, no dash) and gnu options (double dash)

ps
- unix
    -e all processes
    -f full format
    -l additional columns
    -H hierarchy in tree view
    -L individual threads
    -o pid,tid,euid,pgrp format (comma separated list of items)
- bsd
    a all processes
    u user orientated format
    x all precesses owned by the user
    f process tree
    o format for the output
    k sort order of the input

- gnu
    --format
    --forest tree
    --no-headers no header lines
    --sort specify the sorting order
pstree
pgrep
top
system monitor











$? → last exit code





Tmux
--------------------

( <b>& ) → kill window
( <b>x ) → kill pane
( <b>% ) → split horizontal
( <b>" ) → split vertical
( <b>arrow ) → move between splits
( <b>}{ ) → move pane
( <b>! ) → turn pane into a window
( list-keys ) → shortcuts
tmux new -s session-name
tmux attach -t session-name


macOS
--------------------
sudo purge → clear system cache
sysctl -a | grep swap → view current swap usage
sudo fs_usage | grep swapfile → monitor swap file activity


PACKAGE MANAGERS
--------------------
yum install samba samba-client samba-common



PARTITIONS
----------

p g - espacio disco duro
a - agregar particion
w - guaedar cambios
q - cerrar creación de particiones

Particiones estándar para un esquema de servidor Unix

BSD
-----
root        -> /                -> 2GB
swap        -> ---              -> RAM x 2
temp        -> /tmp             -> RAM x 2
programas   -> /usr             -> 28GB (a consideración de la instalación)
var         -> /var             -> 700GB (a consideración de la instalación)
logs        -> /var/log         -> 10GB
hiawatha    -> /var/www/logs    -> 10GB
home        -> /home            -> Restante

* en linux a veces usan opt en vez de var



HOMEBREW
--------------------

brew leaves → only show packages without dependencies
brew upgrade {package-name} → only show packages without dependencies

ORACLE
--------------------
( /etc/oratab ) → dónde encontrar los archivos en los que se encuentran los connection strings
    {nombre-db}:{ubicación-config}:{N indica que se monta al inicio del sistema}
( {ubicación-config}/tnsnames.ora ) → contiene los connections strings

NETWORK
--------------------

( netstat -tuplen ) → ver ip tables
( telnet {server} 80 ) → ver si es accesible desde afuera el puerto 80
( lsof -i -P -n ) → list open ports
( ss -tuln iptables -t {table} -vL ) → lista todas las reglas de iptables de la tabla en específico verbose
( tracert, traceroute, tracepath ) → route packets take to host
( lspci ) → nics
( doas pkill hiawatha ; doas hiawatha ) → reinicio de hiawatha
( hostnamectl command ) → Display host name and Linux distro info on systemd based distros.
( lspci | grep -E -i --color 'network|ethernet' ) → ver nics fisicos
( ip link show, ip a ) → para revisar número de nics, los que importan son los que están como eth y emo y que estén up
( ip address ) → configuration of network
( ifconfig ) → configuration of network
( netstat -rn / route -n ) → manipulating and showing ip routing table
( /etc/sysconfig/network-scripts/ifcg-{device-name} ) → software interface for network device
/etc/systemd/system/some_target.target.wants -> autostart files (services) sudo rm /etc/systemd/system/nginx.service remove service unit
( dig ) → dns lookup
( ethtool ) → dns lookup
( nmcli con show ) → show all available connections
( doas netstat -na -f inet inet | grep LISTEN ) → listenin ports
( ifup/ifdown) → enable/disable nic
( systemctl restart NetworkManager.service) → restart web service
( systemctl {enable/statu/statuss/disable/start/stop/reload/reload-or-restart/is-active/is.failed/is-enabled/list-units/list-unit-files/cat/list-dependencies/show/mask}) →
( systemctl {enable/statu/statuss/disable/start/stop/reload/reload-or-restart/is-active/is.failed/is-enabled/list-units/list-unit-files/cat/list-dependencies/show/mask/edit --full}) →
( sudo systemctl restart mysql ) → restart mysql
( pkg_delete ) → remove installed package
( /etc/pkg.conf ) → package repository


SUSE LINUX ENTERPRISE
---------------------
zipper →
→
→
→
→
→
→
→
→
→
→
→
→


SCRIPTING
---------
( test )
    file
    -b exists block
    -c exists char
    -d exists dir
    -e exists
    -w writable
    -x executable
    -r readable
    -nt -ot -ef newer, older, equal

    string
    -n nonzero
    -z zero
    = != < >

    algebraic
    -eq -ne -gt -ge -lt -le equal,notequal,greater,lower



SYSADMIN
--------------------
( lsmod ) → list of current loaded kernel modules
( man -k {keyword} ) → search manpages and section using keyword
( apropos {keyword} ) → search manpages using keyword
( whatis ) → description in one line
( man {section} {command} ) → view man page section
( info ) → navigate manpages in tree format (suse, requires emacs)
( !{history} ) → execute command in history
( pushd ) →
( popd ) →
( pwd -P ) → physical directory
( ls -R ) → Recursive
( ls -d ./* ) → Only directories
( tree -L {level} ) → show directories in tree format
( tree -f ) → path prefix

( cp )
-p keep permissions, owner and timestamps
-i confirm overwriting
-n do not overwrite
-u copy only if source is newer

( mv )
-i confirm overwriting
-f do not prompt if destination exists
-n do not overwrite
-u copy only if source is newer



mkdir -p - create parent directories
rm -i force confirmation for deletion
rm -f force no confirmation

stat {filename}  file info




head -n


( ps -ax ) → list all processes
( ps -ax | grep httpd ) → process using httpd
( ps -a | grep -i postgres ) → check running process
( pkill ) → signal process by name
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


PERMISSIONS
--------------------

( chmod, chown )
- refs:{a}ll, {u}ser, {g}roup, {o}ther
- modes:{r}ead, {w}rite, e{x}ecute
- operators:{-}remove, {+}add, {=}clear

( chmod (-R) {ref}{operator}{modes}/{octets} {file/dir} ) → change modes
( chmod u=rwx,go=u-w ) → readable/executable by everyone and writable by owner only
ejemplo: chmod -R 777 FSW_NET/

file 666, dir 777


umask is set in
/etc/login.defs


( chown )
( chown -R {owner}:{group} {file/dir}) → change owner recursively


special permissions
not related to user or group
u+s,g+s,o+t

executed processes have the uid of the person who executed them

set user id (suid) on file
    → executed file resulting process has the uid of the file owner. it has no effect of directories
    → x bit on user is changed to an s, or S if x is not set in octal is 4

set group id (sgid) on file
    → executed file resulting process has the gid of the file owner. it has no effect of directories
    → x bit on group is changed to an s, or S if x is not set in octal is 2

set group id (sgid) on dir
    → file or dir created in it will inherit the group ownership of parent dir
sticky bit
    → protects files and directories from being accidentaly deleted or renamed
    → x bit on other is changed to an s, or S if x is not set in octal is 1








rwx
421


BASH
--------------------

( ln -s {source} {target}) → symlinks
( tar -xvf {filename} ) → extract
( tar -czvf {filename} {data} ) → compress
( fswatch -xr {directory}) → watch directory changes
( watch ) → exec program periodically fullscreen
( scp {user}@{host}:{remote-file} {destination} -P {port} )
( cat ~/.ssh/id_rsa.pub | ssh {user}@{host} -p {port} 'cat >> ~/.ssh/authorized_keys' )
( sshfs {user}@{host}:{directory} -o port={port} ) → mount filesystem
( diff ) → diff -q dir-1/ dir-2/
( ls -d */ ) → list dirs
( dd ) → DISK DESTROYER, convert format and copy a file
( expr ) → calculate math expressions
( pax, cpio ) → other archive utilty
( stty ) → sets certain I/O options for the device that is the current standard input
( tty ) → name of the terminal
( sync ) → synchronizes cached data to permanent storage.
( wait4path ) → sleeps until path exists
( mdfind ) → spotlight

Creación de directorio de usuario
--------------------

mkhomedir_helper {username}
 ó
doas mkdir /home/david.diosdado
doas cp -r /etc/skel/. /home/david.diosdado
doas chown -R david.diosdado:david.diosdado /home/david.diosdado


SEARCH
--------------------

( bsd grep )
grep -irwn 'string' 'absolute-path'
( grep {flags} {regex} {location pattern}-v ) → inverse
( grep -r --include \*.php "TEXTO" ) → encuentra archivos con TEXTO (bsd grep)
( find . -name "*.php" -exec grep "TEXTO" {} \; ) → encuentra archivos con TEXTO (gnu grep)
-P never follow symlinks
-L follow symlinks
-D debug
-empty if file is empty (check man for test)
-o or
-a and




( -r ) → recursive directory
( -i ) → case insensitive
( -n ) → line number
( -c ) → count occurrences
( --include ) → especifica qué archivos revisar, se pone un --include por cada pattern

find
--------------------

( find {location} -type f/d -name {regex} )
( -exec ) → execute command
( {} ) → placeholder for find results
( \; ) → execute command for each file
( \+ ) → concatenate all find results and execute command for that resulting line
{find command} -exec command {}
( -name ) → type f/d
( locate ) → find names in internal database without traversing file system
( fzf --preview="bat --color=always {}) → preview file using program, for example cat or bat

Text processing
--------------------

( awk -F, '$3 < 50 {print $1, $2}' data.csv ) → show fields 1 and 2 of the rows in which field 3 is smaller than 50


Yabai
--------------------

( ⇧⌥o ) → opacity window
( ^⌥o ) → opacity focused
( ⇧⌥v ) → toggle vertical
( ⇧⌥r ) → rotate layout
( ^⌥f ) → zoom fullscreen
( ^⇧{hjkl} ) → resize
( ⇧⌘{hjkl} ) → move
( ⇧⌥{hjkl} ) → focus
( meh{hjkl} ) → move to screen
( ⇧⌥b ) → balance
( ⇧⌥↵ ) → make main
( ⇧⌥f ) → float window

Marks
--------------------

( :marks )
( ma ) → mark a
( `a ) → jump to a
( y`a ) → yank to a
( `0 ) → jump to where closed
( `= ) → jump to last edited
( `. ) → jump to last change
( `` ) → jump to last jump
( `= ) → jump to last edited

( :ju[umps] )
( ^i ) → jump forward
( ^o ) → jump backwards

( :changes )
( g, ) → go to newer changes
( g; ) → go to older changes

Netrw
--------------------

( d ) → new dir
( a ) → hidden files
( c ) → set current dir
( gh ) → toggle dot files
( r ) → reverse sorting
( s ) → sorting type
( S ) → sort by suffix/prefix
( X ) → execute file
( i ) → tree view
( mt ) → assign target
( mf ) → mark file
( mc ) → copy files in the target
( mm ) → move files to the target
( mx ) → run external command

Vim-surround
--------------------

( cs{sur}{new} ) → change surround to new
( ds{sur} ) → delete surround
( ys{i/a}{element} → surround inside or around element (ysiw' ) → 'word')
( yss{sur} ) → surround line
( S{sur} ) → surround visual mode

Vim-commentary
--------------------

( gcc ) → comment line
( gc{motion} ) → comment motion

Telescope
--------------------

( ps ) → document symbols
( pw ) → grep string
( pr ) → live grep
( pd ) → all files

Plugins
--------------------

( :LspInfo ) → info de los servidores de lenguajes

Vim Remaps
--------------------

( _j ) → quickfix prev
( _k ) → quickfix next

LSP
--------------------

( K ) → definition help hover
( _vws ) → vim.lsp.buf.workspace_symbol()
( _vd ) → vim.diagnostic.open_float()
( [d ) → vim.diagnostic.goto_next()
( ]d ) → vim.diagnostic.goto_prev()
( _vca ) → vim.lsp.buf.code_action()
( _vrr ) → vim.lsp.buf.references()
( _vrn ) → vim.lsp.buf.rename()
( ^s ) → vim.lsp.buf.signature_help()

Vim Search
--------------------

( /\v ) → use nonalpha as regex
( :noh[lsearch] ) → remove highlight

Range:
( . ) → Current line
( $ ) → line
( % ) → Whole file
( x ) → Line number x
( .,+x ) → From current until x lines
( 't ) → position of mark "t"
( \/ ) → next line previous search matches
( \? ) → prev line previous search matches
( \& ) → next line previous substitute matches
( :vim[grep]/pattern/{`{file}`} ) → find in files
( :cn[ext] ) → next match
( :cp[rev] ) → prev match
( :cope[n] ) → list matches
( :cll[ose] ) → close quickfix view

Flags:
( i/I ) → case
( c ) → confirm each

replace with HI (y/n/a/q/l/^E/^Y)?:
( a ) → all
( q ) → quit no substituting not undo
( l ) → substitute this and exit
( ^E ) → scroll up
( ^Y ) → scroll down

Greedy
( \+ ) → 1 or more
( \= ) → 0 or 1 more
( \{n,m} ) → from n to m
( \{n} ) → exactly n times
( \{,m} ) → from 0 to m
( \{n,} ) → at least n

Non-greedy

( \{-} ) → 0 or more
( \{-n,m} ) → 1 or more
( \{-n,} ) → at lease or more
( \{-,m} ) → 1 or more

Grouping & Backreferences

( & ) → whole matched pattern
( \L ) → following characters are made lowercase
( \0 ) → whole matched pattern
( \U ) → following characters are made uppercase
( \E ) → end of \U and \L
( \e ) → end of \U and \L
( \l ) → next character made lowercase
( ~ ) → previous substitute string
( \u ) → next character made uppercase

Vim
--------------------

( _c ) → quickfix open
( ^[ ) → quickfix next
( ^] ) → quickfix prev
( ^q ) → from telescope, send to quickfix list
( '' ) → move between last two motions
( m{letter} ) → create a mark
( m{LETTER} ) → create a global mark
( '{letter} ) → go to mark
( :w !sudo tee % ) → save file with sudo
( ^w ) → windows (s:split, w:switch, q:quit, v:split)
( :!chmod +w % ) → make file writeable
( R ) → replace until ESC
( gd ) → local declaration
( gD ) → global declaration
( ge_ ) → last non-blank char
( gwip ) → paragraph to 1 line
( :sav ) → save as
( :reg ) → registers

Insert mode
( ^w ) → delete word
( ^t ) → tab
( ^d ) → de-indent

Visual mode

( o ) → start/end selection
( ~ ) → switch case
( ^a ) → increment numbers
( ^x ) → decrement numbers
( >i{ ) → Increase inner block indent
( =2a{ ) → Re-indent '2 blocks'
( ]p ) → Paste match indent
( % ) → {} or []
( p ) → paragraph




IP
---------

10.0.1.50 prettyhatemachine




Layers
---------

7 - Application - Humana-computer interaction layer, where applicationscan access the network services
6 - Presentation - Ensures that data is in an usable format and is where data encryption occurs
5 - Session - Maintains connections and is responsible for controlling ports and sessions
4 - Transport - Transmits data using transmission protocols including TCP and UDP
3 - Network - Decides which physical path the data will take
2 - Data Link - Defines the format of data on the network
1 - Physical - Transmits raw bit stream over the physical medium









