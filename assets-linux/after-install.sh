#!/bin/bash

# Link to the binary
ln -sf /opt/tinker/Tinker /usr/local/bin/tinker

# Launcher icon
desktop-file-install /opt/tinker/tinker.desktop
