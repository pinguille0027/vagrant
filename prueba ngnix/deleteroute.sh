#!/bin/sh
ip route delete default dev eth0
ip route add default dev eth1