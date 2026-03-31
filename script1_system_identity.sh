#!/bin/bash

STUDENT_NAME="mahima pathariya"
SOFTWARE_CHOICE="Git"

KERNEL=$(uname -r)
DISTRO=$(grep PRETTY_NAME /etc/os-release 2>/dev/null | cut -d= -f2 | tr -d '"')
[ -z "$DISTRO" ] && DISTRO=$(uname -o)

USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
DATETIME=$(date '+%A, %d %B %Y  %H:%M:%S')
OS_LICENSE="GNU General Public License version 2 (GPL v2)"

echo "========================================================"
echo "       Open Source Audit — System Identity Report       "
echo "========================================================"
echo ""
echo "  Student      : $STUDENT_NAME"
echo "  OSS Project  : $SOFTWARE_CHOICE"
echo ""
echo "--------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "--------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date & Time  : $DATETIME"
echo ""
echo "--------------------------------------------------------"
echo "  LICENSE NOTE"
echo "--------------------------------------------------------"
echo "  The Linux kernel on this machine is covered by the:"
echo "  $OS_LICENSE"
echo "========================================================"
