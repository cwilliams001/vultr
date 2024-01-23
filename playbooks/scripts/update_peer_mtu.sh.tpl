#!/bin/bash

peer_dir="$1"

config_file="$peer_dir/${peer_dir##*/}.conf"

if grep -q '^MTU =' "$config_file"; then
  
  sed -i "s/^MTU =.*/MTU = {{ peer_mtu_value }}/" "$config_file"

else
  
  sed -i "/^\[Interface\]/a MTU = {{ peer_mtu_value }}" "$config_file"
fi