#!/bin/sh

BUDLIX_DIR=${HOME}/.budlix
mkdir -p ${BUDLIX_DIR}
mkdir -p ${BUDLIX_DIR}/profile/default
ln -sf default ${BUDLIX_DIR}/profile/current

rsync -avz -delete Makefile *.mk COPYING README support packages ${BUDLIX_DIR}/main
sudo install -m 755 -D blx /usr/bin/blx

# for u in $(cat /etc/passwd | awk -F':' '{ print $1 }');
# do
#     mkdir -p /blx/per-user/$u
#     chown -R $u /blx/per-user/$u
# done
# chmod -R ugo+rw /blx/build
