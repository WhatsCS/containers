# #!/bin/bash

# # Information output
echo "Running on Debian $(cat /etc/debian_version)"
echo "Current timezone: $(cat /etc/timezone)"
wine --version

wine vu/client/vu.com -gamepath bf3 -activate -o_mail ${EA_EMAIL} -o_pass ${EA_PASSWORD}

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}