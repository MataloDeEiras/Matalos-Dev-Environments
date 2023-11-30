#!/bin/bash

# PostStartCommand script for devcontainer.json

# Restart xrdp service
/etc/init.d/xrdp stop
/etc/init.d/xrdp start
