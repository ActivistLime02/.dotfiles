#!/bin/bash
sudo rmmod nvidia_drm nvidia_uvm nvidia_modeset nvidia
sudo modprobe nouveau
