#!/usr/bin/env bash

set -e

# $1 - source dir
# $2 - dest dir
do_install() {
    local src=$1
    local dst=$2

    for o in $(ls -1 $src); do
        if [ -d "$src/$o" ]; then
            mkdir -pv $dst/$o
	    do_install $src/$o $dst/$o
	elif [ -f "$src/$o" ]; then
	    ln -sfv $src/$o $dst/$o
	fi
    done
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
    fi

    if [ "${install}" == "y" ]; then
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

        do_install $src $dst
    fi
}

trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
warn()   { trace "${@}" >&2; }
errorN() { local ret="${1}"; shift; warn "${@}"; exit ${ret}; }
error()  { errorN 1 "${@}"; }

my_name="${0##*/}"
main "${@}"
