echo "Creating your chroot environment" 

echo "ChrootDirectory /choot/" >> /etc/ssh/sshd_config

systemctl reload sshd.service

mkdir choot
cd choot
mkdir -p dev etc lib lib64 usr bin usr/bin home/cmorris
chown -R root:root ../choot
mknod -m 666 dev/null c 1 3
cp /etc/ld.so.cache etc/
cp /etc/ld.so.conf etc/
cp /etc/nsswitch.conf etc/
cp /etc/hosts etc/
cp /usr/bin/ls usr/bin/
cp /usr/bin/bash usr/bin/
for i in $(ldd /bin/bash | cut -d ">" -f2 | cut -d"(" -f1); do cp $i lib64; done
for i in $(ldd /bin/ls | cut -d ">" -f2 | cut -d"(" -f1); do cp $i lib64; done
for i in $(ldd /bin/touch | cut -d ">" -f2 | cut -d"(" -f1); do cp $i lib64; done
for i in $(ldd /bin/rm | cut -d ">" -f2 | cut -d"(" -f1); do cp $i lib64; done
for i in $(ldd /usr/bin/vim | cut -d ">" -f2 | cut -d"(" -f1); do cp $i lib64; done
for i in $(ldd /usr/bin/htop | cut -d ">" -f2 | cut -d"(" -f1); do cp $i lib64; done
for i in $(ldd /bin/su | cut -d ">" -f2 | cut -d"(" -f1); do cp $i lib64; done
for i in $(ldd /bin/mkdir | cut -d ">" -f2 | cut -d"(" -f1); do cp $i lib64; done
for i in $(ldd /bin/clear | cut -d ">" -f2 | cut -d"(" -f1); do cp $i lib64; done
for i in $(ldd /usr/bin/ssh | cut -d ">" -f2 | cut -d"(" -f1); do cp $i lib64; done
for i in $(ldd /bin/ps | cut -d ">" -f2 | cut -d"(" -f1); do cp $i lib64; done

cp /bin/{bash,touch,ls,rm,su,mkdir,clear,ps} bin/
cp /usr/bin/{bash,vim,htop,ssh} usr/bin/

chown -R root:root ../choot
chown cmorris:cmorris home/cmorris
chmod -R 755 ../choot
chmod 700 home/cmorris

cp /home/cmorris/.bashrc home/cmorris/

echo " Welcome to your chroot, this is setup on port 22 of your machine over ssh as well" 
chroot .
