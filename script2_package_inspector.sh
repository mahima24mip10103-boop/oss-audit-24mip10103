#!/bin/bash

PACKAGE=${1:-git}

echo "========================================================"
echo "       FOSS Package Inspector                          "
echo "========================================================"
echo "  Inspecting package : $PACKAGE"
echo "--------------------------------------------------------"

if command -v rpm &>/dev/null; then
    PKG_MANAGER="rpm"
elif command -v dpkg &>/dev/null; then
    PKG_MANAGER="dpkg"
else
    PKG_MANAGER="unknown"
fi

echo "  Package manager : $PKG_MANAGER"
echo ""

if [ "$PKG_MANAGER" = "rpm" ]; then
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "  STATUS : $PACKAGE is INSTALLED."
        rpm -qi "$PACKAGE" | grep -E "^Version|^License|^Summary" | while IFS= read -r line; do echo "    $line"; done
    else
        echo "  STATUS : $PACKAGE is NOT installed."
        echo "  Tip    : sudo dnf install $PACKAGE"
    fi
elif [ "$PKG_MANAGER" = "dpkg" ]; then
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
        echo "  STATUS : $PACKAGE is INSTALLED."
        if command -v apt-cache &>/dev/null; then
            apt-cache show "$PACKAGE" 2>/dev/null | grep -E "^Version|^Section|^Homepage" | while IFS= read -r line; do echo "    $line"; done
        fi
    else
        echo "  STATUS : $PACKAGE is NOT installed."
        echo "  Tip    : sudo apt install $PACKAGE"
    fi
else
    if which "$PACKAGE" &>/dev/null; then
        echo "  STATUS : Binary found at $(which $PACKAGE)"
    else
        echo "  STATUS : Cannot determine — no known package manager found."
    fi
fi

echo ""
echo "--------------------------------------------------------"
echo "  OPEN SOURCE PHILOSOPHY NOTE"
echo "--------------------------------------------------------"

case "$PACKAGE" in
    git)
        echo "  Git: Linus Torvalds built this when a proprietary tool"
        echo "  failed him — freedom to control your tools is a necessity."
        ;;
    httpd | apache2)
        echo "  Apache: the web server that built the open internet."
        ;;
    mysql | mariadb)
        echo "  MySQL: open source at the heart of millions of applications."
        ;;
    vlc)
        echo "  VLC: built by students who simply wanted to stream video."
        ;;
    firefox)
        echo "  Firefox: a nonprofit fighting for an open web."
        ;;
    python3 | python)
        echo "  Python: a language shaped entirely by its community."
        ;;
    libreoffice)
        echo "  LibreOffice: born from a fork when the community spoke."
        ;;
    *)
        echo "  $PACKAGE: someone built this and chose to share it freely."
        ;;
esac

echo "========================================================"
