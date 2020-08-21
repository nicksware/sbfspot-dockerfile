#!/bin/bash
bluetoothctl power on
/opt/sbfspot.3/SBFspot -cfg/etc/SBFspot.cfg "$@"
