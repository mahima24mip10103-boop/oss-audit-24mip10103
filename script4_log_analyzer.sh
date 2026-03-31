#!/bin/bash

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0
MAX_RETRIES=3
ATTEMPT=1

if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    exit 1
fi

echo "========================================================"
echo "       Log File Analyzer                               "
echo "========================================================"
echo "  Log file : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo "--------------------------------------------------------"

while true; do
    if [ ! -f "$LOGFILE" ]; then
        echo "  ERROR: File '$LOGFILE' not found. (Attempt $ATTEMPT of $MAX_RETRIES)"
        if [ $ATTEMPT -lt $MAX_RETRIES ]; then
            read -p "  Enter a valid log file path: " LOGFILE
            [ -z "$LOGFILE" ] && echo "  No file provided. Exiting." && exit 1
            ATTEMPT=$((ATTEMPT + 1))
            continue
        else
            echo "  Maximum retries reached. Exiting."
            exit 1
        fi
    fi

    if [ ! -s "$LOGFILE" ]; then
        echo "  WARNING: '$LOGFILE' is empty. (Attempt $ATTEMPT of $MAX_RETRIES)"
        if [ $ATTEMPT -lt $MAX_RETRIES ]; then
            read -p "  Enter a different log file path: " LOGFILE
            [ -z "$LOGFILE" ] && exit 1
            ATTEMPT=$((ATTEMPT + 1))
            continue
        else
            echo "  Maximum retries reached. Exiting."
            exit 1
        fi
    fi
    break
done

echo "  Scanning file..."
echo ""

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "  -------------------------------------------------------"
echo "  RESULT : '$KEYWORD' found $COUNT time(s) in $(wc -l < "$LOGFILE") total lines."
echo "  -------------------------------------------------------"
echo ""

if [ $COUNT -gt 0 ]; then
    echo "  Last 5 matching lines:"
    echo ""
    grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r MATCH_LINE; do
        echo "    >> $MATCH_LINE"
    done
else
    echo "  No matches found for '$KEYWORD'."
fi

echo ""
echo "========================================================"
