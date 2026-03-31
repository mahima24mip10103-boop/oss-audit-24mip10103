#!/bin/bash

echo "========================================================"
echo "    Open Source Manifesto Generator                    "
echo "========================================================"
echo ""
echo "  Answer three questions to generate your manifesto."
echo ""

read -p "  1. One open-source tool you use every day: " TOOL
echo ""
read -p "  2. In one word, what does freedom mean to you? " FREEDOM
echo ""
read -p "  3. One thing you would build and share freely: " BUILD
echo ""

DATE=$(date '+%d %B %Y')
AUTHOR=$(whoami)
OUTPUT="manifesto_${AUTHOR}.txt"

echo "========================================" > "$OUTPUT"
echo "         MY OPEN SOURCE MANIFESTO      " >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Author : $AUTHOR" >> "$OUTPUT"
echo "  Date   : $DATE" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Every day I use $TOOL, a tool built by people" >> "$OUTPUT"
echo "  who chose to share their work freely." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  To me, freedom means $FREEDOM. In software," >> "$OUTPUT"
echo "  that freedom lives in source code anyone can" >> "$OUTPUT"
echo "  read, modify, and redistribute." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  If I could build one thing and give it away," >> "$OUTPUT"
echo "  it would be $BUILD." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  I stand on the shoulders of giants." >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"

echo "  Manifesto saved to: $OUTPUT"
echo ""
cat "$OUTPUT"
