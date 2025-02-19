#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Klassy - Depreciated Dependencies
rpm-ostree install dnf-plugins-core
# dnf-3 config-manager --add-repo https://download.opensuse.org/repositories/home:paul4us/Fedora_41/home:paul4us.repo
# rpm-ostree install klassy

# Ghostty
dnf5 copr enable -y pgdev/ghostty
rpm-ostree install ghostty

# this installs a package from fedora repos
rpm-ostree install mtr neovim syncthing

# this would install a package from rpmfusion
# rpm-ostree install vlc

wget -O /tmp/yEd-3.25-setup.sh "https://www.yworks.com/resources/yed/demo/yEd-3.25_with-JRE23_64-bit_setup.sh"
chmod +x /tmp/yEd-3.25-setup.sh
/tmp/yEd-3.25-setup.sh -varfile /tmp/response.varfile

dnf5 remove -y dnf-plugins-core
#### Example for enabling a System Unit File

systemctl enable podman.socket
