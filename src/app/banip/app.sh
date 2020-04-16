## -----------------------------------------------------------------------------
## Linux Scripts.
## AutoSave app functions
##
## @package ojullien\bash\app\autosave
## @license MIT <https://github.com/ojullien/bash-banip/blob/master/LICENSE>
## -----------------------------------------------------------------------------

BanIp::showHelp() {
    String::notice "Usage: $(basename "$0") [options] <ip 1> [ip 2 ...]"
    String::notice "\tBan an ip using fail2ban the '${m_FAIL2BAN_JAIL}' jail."
    String::notice "\t-16 | --cidr-prefix-16\t/16 CIDR prefix. Apply this equivalent mask 255.255.0.0 to the ips"
    String::notice "\t-24 | --cidr-prefix-24\t/24 CIDR prefix. Apply this equivalent mask 255.255.255.0 to the ips"
    String::notice "\t<ip>\tX.X or X.X.X ip format depending on CIDR option."
    return 0
}
