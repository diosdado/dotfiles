#!/usr/bin/env bash


local_dir=~/mounted-sshfs
host=""
port=""
remote_dir=""
host=""


if [ ! -d $directory ]; then
  mkdir -p $directory;
fi

user_name=$(whoami)
user_id=$(id -u $user_name)
group_id=$(id -g $user_name)


mount_command="sshfs $user_name@$host:$remote_dir $local_dir/ -o port=$port,default_permissions,allow_other,uid=501,gid=20"
