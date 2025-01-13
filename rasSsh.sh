#!/bin/bash

# Start the cloudflared tunnel
echo "Starting Cloudflare Access TCP tunnel..."
sudo cloudflared access tcp --hostname ssh.borisgans.com --url localhost:22 &

# Save the PID of the cloudflared process
CLOUDFLARED_PID=$!

# Wait a moment to ensure the tunnel is established
sleep 5

# Connect to the Raspberry Pi via SSH
echo "Connecting to the Raspberry Pi via SSH..."
echo "For more connections, ssh pubRas"

ssh -v -i ~/.ssh/id_rsa borisgans@localhost
# ssh pubRas1

# Clean up the cloudflared tunnel after the SSH session ends
echo "Stopping Cloudflare Access TCP tunnel..."
kill $CLOUDFLARED_PID
