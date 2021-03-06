# Bash-BanIP

Simple tool for banning ip using fail2ban.

_Note: I use this script for my own projects, it contains only the features I need._

## Table of Contents

[Installation](#installation) | [Features](#features) | [Test](#test) | [Contributing](#contributing) | [License](#license)

## Installation

Requires: a Debian/Ubuntu version of linux and a Bash version ^4.4. [fail2ban](https://github.com/fail2ban/fail2ban), [bash-sys](https://github.com/ojullien/bash-sys) are installed.

1. [Download a release](https://github.com/ojullien/bash-banip/releases) or clone this repository.
2. Use [scripts/install.sh](scripts/install.sh) to automatically install the application in the /opt/oju/bash project folder.
3. If needed, add `PATH="$PATH:/opt/oju/bash/bin"` to the .profile files.
4. Update the [config.sh](src/app/banip/config.sh) configuration file.

## Features

This tool allows you to use fail2ban to ban an ip adding this ip to an existing jail. The jail is defined in the [config.sh](src/app/banip/config.sh) file.

```bash
Usage: banip.sh [options] <ip> [ip ...]

options
 -16 | --16             /16 CIDR prefix. Apply this equivalent mask 255.255.0.0 to the ips.
 -24 | --24             /24 CIDR prefix. Apply this equivalent mask 255.255.255.0 to the ips.
  -h | --help           Show this help.
```

## Test

I didn't write any line of 'unit test' code. Sorry.

## Contributing

Thanks you for taking the time to contribute. Please fork the repository and make changes as you'd like.

As I use these scripts for my own projects, they contain only the features I need. But If you have any ideas, just open an [issue](https://github.com/ojullien/bash-banip/issues/new/choose) and tell me what you think. Pull requests are also warmly welcome.

If you encounter any **bugs**, please open an [issue](https://github.com/ojullien/bash-banip/issues/new/choose).

Be sure to include a title and clear description,as much relevant information as possible, and a code sample or an executable test case demonstrating the expected behavior that is not occurring.

## License

This project is open-source and is licensed under the [MIT License](LICENSE).
