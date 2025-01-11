#!/bin/bash

echo "Authenticating client..."
cloudflared access ssh --hostname ssh.borisgans.com
echo "Success!!"
