#!/bin/bash

# Start the cloudflared tunnel
echo "Don't forget to turn on VPN"
echo "Starting Cloudflare Access TCP tunnel..."
sudo cloudflared access tcp --hostname ssh.borisgans.com --url localhost:4444 &
# sudo cloudflared access tcp --hostname ssh.borisgans.com --url localhost:22 &

# Save the PID of the cloudflared process
CLOUDFLARED_PID=$!

# Wait a moment to ensure the tunnel is established
sleep 10

# Connect to the Raspberry Pi via SSH
echo "Connecting to the Raspberry Pi via SSH..."
echo "For more connections, ssh pubRas1 !"

ssh -p 4444 -i ~/.ssh/id_rsa borisgans@localhost
# ssh pubRas    

# Clean up the cloudflared tunnel after the SSH session ends
echo "Stopping Cloudflare Access TCP tunnel..."
kill $CLOUDFLARED_PID
