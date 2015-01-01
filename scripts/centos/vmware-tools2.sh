ISO_MOUNT="/media"
VMWARE_INSTALL_PL="/tmp/vmware/vmware-tools-distrib/vmware-install.pl"
#VMWARE_REQUIRED_PACKAGES="build-essential"
VMWARE_TOOLS_TMP="/tmp/vmware"
VMWARE_TOOLS_ISO="/root/linux.iso"

echo "Installing virtual machine tools for ${PACKER_BUILDER_TYPE}"
echo "Mounting ${VMWARE_TOOLS_ISO} onto ${ISO_MOUNT}"
mount -o loop ${VMWARE_TOOLS_ISO} ${ISO_MOUNT}

echo "Extracting VMWare Tools to /tmp/vmware"
mkdir -p ${VMWARE_TOOLS_TMP}

echo "Extracting ${ISO_MOUNT}/VMwareTools-*.tar.gz to ${VMWARE_TOOLS_TMP}"
tar xzf ${ISO_MOUNT}/VMwareTools-*.tar.gz -C ${VMWARE_TOOLS_TMP}

echo "Unmounting ${VMWARE_TOOLS_ISO} from ${ISO_MOUNT}"
umount ${ISO_MOUNT}

echo "Running ${VMWARE_INSTALL_PL}"
${VMWARE_INSTALL_PL} << EOF
/usr/bin
/etc/rc.d
/etc/rc.d/init.d
/usr/sbin
/usr/lib/vmware-tools
yes
/usr/share/doc/vmware-tools
yes
yes
no
no
no
no
EOF

echo "Cleaning up ${VMWARE_TOOLS_ISO} and ${VMWARE_TOOLS_TMP}"
rm ${VMWARE_TOOLS_ISO}
rm -rf ${VMWARE_TOOLS_TMP}

# In which directory do you want to install the binary files?
# [/usr/bin]
# /usr/bin

# What is the directory that contains the init directories (rc0.d/ to rc6.d/)?
# [/etc/rc.d]
# /etc/rc.d

# What is the directory that contains the init scripts?
# [/etc/rc.d/init.d]
# /etc/rc.d/init.d

# In which directory do you want to install the daemon files?
# [/usr/sbin]
# /usr/sbin

# In which directory do you want to install the library files?
# [/usr/lib/vmware-tools]
# /usr/lib/vmware-tools

#The path "/usr/lib/vmware-tools" does not exist currently. This program is
# going to create it, including needed parent directories. Is this what you want?
# [yes]
# yes

# In which directory do you want to install the documentation files?
# [/usr/share/doc/vmware-tools]
# /usr/share/doc/vmware-tools

# The path "/usr/share/doc/vmware-tools" does not exist currently. This program
# is going to create it, including needed parent directories. Is this what you
# want?
# [yes]
# yes

# Before running VMware Tools for the first time, you need to configure it by
# vmware-iso: invoking the following command: "/usr/bin/vmware-config-tools.pl". Do you want
# this program to invoke the command for you now?
# [yes]
# yes

# The VMware Host-Guest Filesystem allows for shared folders between the host OS and the guest OS in a Fusion or Workstation virtual environment.  Do you wish to enable this feature?
# [yes]
# no

# The vmblock enables dragging or copying files between host and guest in a
# Fusion or Workstation virtual environment.  Do you wish to enable this feature?
# [yes]
# no

# VMware automatic kernel modules enables automatic building and installation of VMware kernel modules at boot that are not already present. This feature can be enabled/disabled by re-running vmware-config-tools.pl.
# Would you like to enable VMware automatic kernel modules?
# [no]
# no

# Do you want to enable Guest Authentication (vgauth)?
# [yes]
# no
