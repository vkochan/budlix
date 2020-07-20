#!/usr/bin/env bash

set -e

# $1 - dest dir
# $2 - source dir
do_install() {
    local dst=$1
    local src=$2

    for o in $(ls -1 $dst); do
        if [ -d "$dst/$o" ]; then
            mkdir -pv $src/$o
	    do_install  $dst/$o $src/$o
	elif [ -f "$dst/$o" ]; then
	    ln -sfv $dst/$o $src/$o
	fi
    done
}

# $1 - dest dir
# $2 - source dir
do_uninstall() {
	local dst=$1
	local src=$2

	find $src -lname $dst'*' -delete
	find $src -mindepth 1 -type d -empty -delete
}

main() {
    local OPT OPTARG
    local install
    local src dst

    while getopts ":ius:d:" OPT; do
        case "${OPT}" in
        i)  install="y";;
        u)  install="n";;
        s)  src="${OPTARG}";;
        d)  dst="${OPTARG}";;
        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
        ?) error "unknown option '%s'\n" "${OPTARG}";;
        esac
    done

    if [ -z "${install}" ]; then
        error "please specify -i or -u option\n"
    else
        if [ -z "${src}" ]; then
            error "please specify source path (-s)\n"
	else
            [ -e ${src} ] || error "$src does not exist\n"
        fi
        if [ -z "${dst}" ]; then
            error "please specify dest path (-d)\n"
	else
            [ -e ${dst} ] || error "$src does not exist\n"
        fi
    fi

    if [ "${install}" == "y" ]; then
        do_install $dst $src
    elif [ "${install}" == "n" ]; then
        do_uninstall $dst $src
    fi
}

trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
warn()   { trace "${@}" >&2; }
errorN() { local ret="${1}"; shift; warn "${@}"; exit ${ret}; }
error()  { errorN 1 "${@}"; }

my_name="${0##*/}"
main "${@}"
