#!/bin/bash

grep -q '^MTU =' /etc/wireguard/wg0.conf && \

  sed -i "s/^MTU =.*/MTU = {{ server_mtu_value }}/" /etc/wireguard/wg0.conf || \
  
  sed -i '/^\[Interface\]/a MTU = {{ server_mtu_value }}' /etc/wireguard/wg0.conf