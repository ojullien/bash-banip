#!/bin/bash
## -----------------------------------------------------------------------------
## Linux Scripts.
## This tool allows you to use fail2ban to ban an ip adding this ip to an
## existing jail..
##
## @package ojullien\bash\bin
## @license MIT <https://github.com/ojullien/bash-banip/blob/master/LICENSE>
## -----------------------------------------------------------------------------
#set -o errexit
set -o nounset
set -o pipefail

## -----------------------------------------------------------------------------
## Shell scripts directory, eg: /root/work/Shell/src/bin
## -----------------------------------------------------------------------------
readonly m_DIR_REALPATH="$(realpath "$(dirname "$0")")"

## -----------------------------------------------------------------------------
## Load constants
## -----------------------------------------------------------------------------
# shellcheck source=/dev/null
. "${m_DIR_REALPATH}/../sys/constant.sh"

## -----------------------------------------------------------------------------
## Includes sources & configuration
## -----------------------------------------------------------------------------
# shellcheck source=/dev/null
. "${m_DIR_SYS}/runasroot.sh"
# shellcheck source=/dev/null
. "${m_DIR_SYS}/string.sh"
# shellcheck source=/dev/null
. "${m_DIR_SYS}/filesystem.sh"
# shellcheck source=/dev/null
. "${m_DIR_SYS}/option.sh"
# shellcheck source=/dev/null
. "${m_DIR_SYS}/config.sh"
Config::load "banip"
# shellcheck source=/dev/null
. "${m_DIR_APP}/banip/app.sh"

## -----------------------------------------------------------------------------
## Help
## -----------------------------------------------------------------------------
((m_OPTION_SHOWHELP)) && BanIp::showHelp && exit 0
(( 0==$# )) && BanIp::showHelp && exit 1

## -----------------------------------------------------
## Parse the app options and arguments
## -----------------------------------------------------
declare sSuffix=""
declare -i iReturn=1

while (( "$#" )); do
    case "$1" in
    -16|--cidr-prefix-16) # app option
        sSuffix="${m_BANIP_CIDR[16]}"
        shift 1
        String::notice "The ip suffix is set to: ${sSuffix}"
        ;;
    -24|--cidr-prefix-24) # app option
        sSuffix="${m_BANIP_CIDR[24]}"
        shift 1
        String::notice "The ip suffix is set to: ${sSuffix}"
        ;;
    -t|--trace)
        shift
        String::separateLine
        Constant::trace
        BanIp::trace
        Console::waitUser
        ;;
    --*|-*) # unknown option
        shift
        String::separateLine
        BanIp::showHelp
        exit 0
        ;;
    *) # We presume its an ip
        fail2ban-client "${m_FAIL2BAN_VERBOSITY}" set "${m_FAIL2BAN_JAIL}" banip "$1${sSuffix}"
        iReturn=$?
        ((0!=iReturn)) && exit ${iReturn}
        shift
        ;;
    esac
done

exit ${iReturn}
