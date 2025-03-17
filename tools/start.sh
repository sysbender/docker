#!/bin/sh

# Generate SSH host keys if they don't exist
test -f /etc/ssh/ssh_host_rsa_key || ssh-keygen -A

# Start the SSH service
/usr/sbin/sshd

# Run the whoami service on port 80
/usr/local/bin/whoami -port 80
