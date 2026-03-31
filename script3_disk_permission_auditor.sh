#!/bin/bash

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/share" "/var/lib")
GIT_DIRS=("/etc/gitconfig" "$HOME/.gitconfig" "$HOME/.git" "/usr/share/git-core")

echo "========================================================"
echo "       Disk and Permission Auditor                     "
echo "========================================================"
echo "  Run by : $(whoami)  |  Date : $(date '+%d %B %Y %H:%M')"
echo ""
echo "--------------------------------------------------------"
echo "  PART 1 — Standard System Directory Audit"
echo "--------------------------------------------------------"
printf "  %-20s %-25s %s\n" "DIRECTORY" "PERMISSIONS / OWNER" "SIZE"
printf "  %-20s %-25s %s\n" "---------" "-------------------" "----"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3":"$4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "  %-20s %-25s %s\n" "$DIR" "$PERMS" "$SIZE"
    else
        printf "  %-20s %s\n" "$DIR" "[does not exist]"
    fi
done

echo ""
echo "--------------------------------------------------------"
echo "  PART 2 — Git Configuration Directory Audit"
echo "--------------------------------------------------------"

for GDIR in "${GIT_DIRS[@]}"; do
    if [ -e "$GDIR" ]; then
        if [ -d "$GDIR" ]; then
            SIZE=$(du -sh "$GDIR" 2>/dev/null | cut -f1)
        else
            SIZE=$(du -sh "$GDIR" 2>/dev/null | cut -f1)
        fi
        PERMS=$(ls -ld "$GDIR" | awk '{print $1, $3":"$4}')
        echo "  Path  : $GDIR"
        echo "  Perms : $PERMS"
        echo "  Size  : $SIZE"
        echo ""
    else
        echo "  Path  : $GDIR  [NOT FOUND]"
        echo ""
    fi
done

echo "--------------------------------------------------------"
echo "  PART 3 — Git Binary Location"
echo "--------------------------------------------------------"

GIT_BIN=$(which git 2>/dev/null)
if [ -n "$GIT_BIN" ]; then
    echo "  Git binary : $GIT_BIN"
    BIN_PERMS=$(ls -l "$GIT_BIN" | awk '{print $1, $3":"$4}')
    echo "  Permissions: $BIN_PERMS"
    echo "  Version    : $(git --version 2>/dev/null)"
else
    echo "  Git binary NOT found in PATH."
fi

echo "========================================================"
