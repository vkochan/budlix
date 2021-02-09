#!/bin/sh

BUDLIX_DIR=/budlix
mkdir -p ${BUDLIX_DIR}/dl
chmod 777 ${BUDLIX_DIR}/dl

rsync -avz -delete Makefile *.mk COPYING support packages ${BUDLIX_DIR}/
install -m 755 -D blx /usr/bin/blx
install -m 755 -D budlix.sh /etc/profile.d/budlix.sh

# for u in $(cat /etc/passwd | awk -F':' '{ print $1 }');
# do
#     mkdir -p /blx/per-user/$u
#     chown -R $u /blx/per-user/$u
# done
# chmod -R ugo+rw /blx/build
