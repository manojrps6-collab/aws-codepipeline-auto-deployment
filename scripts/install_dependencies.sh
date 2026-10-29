#!/bin/bash
set -e

if command -v dnf >/dev/null 2>&1; then
    dnf install -y httpd
elif command -v yum >/dev/null 2>&1; then
    yum install -y httpd
else
    echo "No supported package manager found"
    exit 1
fi

mkdir -p /var/www/html