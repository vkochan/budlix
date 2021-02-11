#!/bin/sh

export BLX_USER_PROFILE=${HOME}/.budlix/profile/current
export BLX_USER_ROOT=${BLX_USER_PROFILE}/sysroot

BLX_USER_PATH="${BLX_USER_ROOT}/bin"
BLX_USER_PATH="${BLX_USER_ROOT}/sbin:${BLX_USER_PATH}"
BLX_USER_PATH="${BLX_USER_ROOT}/usr/bin:${BLX_USER_PATH}"
BLX_USER_PATH="${BLX_USER_ROOT}/usr/sbin:${BLX_USER_PATH}"
BLX_USER_PATH="${BLX_USER_ROOT}/usr/local/bin:${BLX_USER_PATH}"
BLX_USER_PATH="${BLX_USER_ROOT}/usr/local/sbin:${BLX_USER_PATH}"

BLX_USER_MANPATH="${BLX_USER_ROOT}/usr/man"
BLX_USER_MANPATH="${BLX_USER_ROOT}/usr/share/man:${BLX_USER_MANPATH}"

BLX_USER_TERMINFO="${BLX_USER_ROOT}/usr/share/terminfo"

export BLX_SYS_PROFILE=/budlix/profile/system
export BLX_SYS_ROOT=${BLX_SYS_PROFILE}/sysroot

BLX_SYS_PATH="${BLX_SYS_ROOT}/bin"
BLX_SYS_PATH="${BLX_SYS_ROOT}/sbin:${BLX_SYS_PATH}"
BLX_SYS_PATH="${BLX_SYS_ROOT}/usr/bin:${BLX_SYS_PATH}"
BLX_SYS_PATH="${BLX_SYS_ROOT}/usr/sbin:${BLX_SYS_PATH}"
BLX_SYS_PATH="${BLX_SYS_ROOT}/usr/local/bin:${BLX_SYS_PATH}"
BLX_SYS_PATH="${BLX_SYS_ROOT}/usr/local/sbin:${BLX_SYS_PATH}"

BLX_SYS_MANPATH="${BLX_SYS_ROOT}/usr/man"
BLX_SYS_MANPATH="${BLX_SYS_ROOT}/usr/share/man:${BLX_SYS_MANPATH}"

BLX_SYS_TERMINFO="${BLX_SYS_ROOT}/usr/share/terminfo"

export PATH=${BLX_USER_PATH}:${BLX_SYS_PATH}:${PATH}
export MANPATH=${BLX_USER_MANPATH}:${BLX_SYS_MANPATH}:/usr/man:/usr/share/man
export TERMINFO_DIRS=${BLX_USER_TERMINFO}:${BLX_SYS_TERMINFO}:/usr/share/terminfo

if [ -d ${BLX_SYS_PROFILE}/sysroot/etc/budlix/env ]; then
    for e in ${BLX_SYS_PROFILE}/sysroot/etc/budlix/env/*; do
        source $e
    done
fi
if [ -d ${BLX_USER_PROFILE}/sysroot/etc/budlix/env ]; then
    for e in ${BLX_USER_PROFILE}/sysroot/etc/budlix/env/*; do
        source $e
    done
fi

[ -e ${BLX_USER_PROFILE}/profile.sh ] && source ${BLX_USER_PROFILE}/profile.sh
