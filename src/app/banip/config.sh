## -----------------------------------------------------------------------------
## Linux Scripts.
## AutoSave app configuration file.
##
## @package ojullien\bash\app\banip
## @license MIT <https://github.com/ojullien/bash-banip/blob/master/LICENSE>
## -----------------------------------------------------------------------------

# Remove these 3 lines once you have configured this file
echo "The 'app/banip/config.sh' file is not configured !!!"
String::error "The 'app/banip/config.sh' file is not configured !!!"
exit 3

## -----------------------------------------------------------------------------
## Fail2ban
## -----------------------------------------------------------------------------
readonly m_FAIL2BAN_JAIL="apache-modsecurity" # you may want to update this line !
readonly m_FAIL2BAN_VERBOSITY="-vvv" # you may want to update this line !

## -----------------------------------------------------------------------------
## CIDR
## -----------------------------------------------------------------------------
readonly -A m_BANIP_CIDR=( [16]=".0.0/16" [24]=".0/24");

## -----------------------------------------------------------------------------
## Trace
## -----------------------------------------------------------------------------
BanIp::trace() {
    String::separateLine
    String::notice "App configuration: BanIp"
    String::notice "\tFail2ban jail:\t\t${m_FAIL2BAN_JAIL}"
    String::notice "\tFail2ban verbosity:\t${m_FAIL2BAN_VERBOSITY}"
    return 0
}
