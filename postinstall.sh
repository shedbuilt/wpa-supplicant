#!/bin/bash
systemctl is-active wpa_supplicant >/dev/null 2>&1
if [ $? -eq 0 ]; then
    systemctl restart wpa_supplicant
else
    systemctl enable wpa_supplicant
    echo "NOTE: You must restart your device in order for WPA Supplicant to function correctly."
fi
