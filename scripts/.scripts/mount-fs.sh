#!/usr/bin/env bash

. ~/.$1.sshvolume.config

if [ ! -d $directory ]; then
  mkdir -p $directory;
fi

user_name=$(whoami)
port_param=""
test -n $port && port_param="port=$port,"
mapped_ids="uid=$(id -u $user_name),gid=$(id -g $user_name),"
default_params="default_permissions,allow_other,reconnect,ServerAliveInterval=15,ServerAliveCountMax=3"

sshfs ${user_name}@${host}:${remote_dir} ${local_dir}/ -o ${port_param}${mapped_ids}${default_params}
# echo "${user_name}@${host}:${remote_dir} ${local_dir}/ -o ${port_param}${mapped_ids}${default_params}"




