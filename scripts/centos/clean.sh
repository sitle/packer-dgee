# clean yum
yum -y clean all

# clear audit log & wtmp
cat /dev/null > /var/log/audit/audit.log
cat /dev/null > /var/log/wtmp

# delete udev persistent device rules
rm -f /etc/udev/rules.d/70-*.rules

# remove trave of the template Mac address and UUIDs
sed -i '/^\(HWADDR\UUID\)=/d' /etc/sysconfig/network-scripts/ifcfg-eth0

# Clean /tmp
rm -fr /tmp/*
rm -fr /var/tmp/*

# Remove SSH host keys
rm -f /etc/ssh/*key*

# Delete root shell history
rm -f /root/.bash_history

