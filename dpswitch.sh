#!bin/bash
# script to switch between X11 and Wayland display server
case $XDG_SESSION_TYPE in
    x11)
    sudo sed -i 's/^WaylandEnable.*/#WaylandEnable=false/' /etc/gdm/custom.conf
    echo "DP server changed to wayland" 
    read -p "Press enter to restart gdm..."
    sudo systemctl restart gdm
    exit;;
    wayland)
    sudo sed -i 's/^#WaylandEnable.*/WaylandEnable=false/' /etc/gdm/custom.conf
    echo "DP server changed to x11"
    read -p "Press enter to restart gdm..."
    sudo systemctl restart gdm
    exit;;
    *)
    echo "cannot find display server type"
    exit;;
esac