#!/usr/bin/bash

SERVICE_FILE_SOURCE="/gunicorn/gunicorn.service"
SERVICE_FILE_DEST="/etc/systemd/system/gunicorn.service"

# Check if the source service file exists
if [ -e "$SERVICE_FILE_SOURCE" ]; then
    # Copy the service file to the destination
    sudo cp "$SERVICE_FILE_SOURCE" "$SERVICE_FILE_DEST"
    sudo systemctl daemon-reload

    # Start and enable the service
    sudo systemctl start gunicorn
    sudo systemctl enable gunicorn

    echo "Gunicorn service started and enabled."
else
    echo "Source service file not found: $SERVICE_FILE_SOURCE"
fi
