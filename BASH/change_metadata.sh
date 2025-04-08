#!/bin/bash

### Uses exiftool to update the Title and Author metadata of all PDF files in a director

SOURCE_DIR="<full_path>"
TITLE="Linux Essentials Certificate"
AUTHOR="VIA Cybersecurity Training Centre KNUST"

for file in "$SOURCE_DIR"/*.pdf; do
    if [ -f "$file" ]; then
        echo "[*] Updating metadata for: $(basename "$file")"

        exiftool -Title="$TITLE" -Author="$AUTHOR" -overwrite_original "$file"

        if [ $? -eq 0 ]; then
            echo "[✓] Updated: $(basename "$file")"
        else
            echo "[!] Failed to update: $(basename "$file")"
        fi
    fi
done
