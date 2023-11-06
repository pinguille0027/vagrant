#!/bin/sh
export DEBIAN_FRONTEND=noninteractive
apt update && apt upgrade
apt install apt-cacher-ng -y && echo cacher instalado