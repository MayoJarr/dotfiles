#!/bin/bash

# Ścieżka do pliku
FILE="/etc/systemd/system/getty.target.wants/getty@tty1.service"

# Sprawdzenie czy plik istnieje
if [[ -f "$FILE" ]]; then
    # Kopia zapasowa pliku
    cp "$FILE" "${FILE}.bak"

    # Zamiana linii zaczynającej się od ExecStart
    sed -i '/^ExecStart/c\ExecStart=-/sbin/agetty -n -o jmajecki %I' "$FILE"

    echo "Linia ExecStart została zamieniona w pliku $FILE."
else
    echo "Plik $FILE nie istnieje."
fi
