
#!/bin/bash
set -e

systemctl enable httpd
systemctl restart httpd

if ! systemctl is-active --quiet httpd; then
    echo "Apache failed to start"
    exit 1
fi

echo "Apache started successfully"
