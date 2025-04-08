#!/bin/bash

### Uses pdftk to make PDF files uneditable

SOURCE_DIR="<full_path>"
DEST_DIR="<full_path>"
OWNER_PASSWORD="<your_password>"

mkdir -p "$DEST_DIR"

for file in "$SOURCE_DIR"/*.pdf; do
    filename=$(basename "$file")
    output_file="$DEST_DIR/$filename"

    pdftk "$file" output "$output_file" owner_pw "$OWNER_PASSWORD" allow printing

    if [ $? -eq 0 ]; then
        echo "[✓] Secured: $filename"
    else
        echo "[!] Failed to secure: $filename"
    fi
done
