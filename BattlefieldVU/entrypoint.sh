# #!/bin/bash

# # Information output
echo "Running on Debian $(cat /etc/debian_version)"
echo "Current timezone: $(cat /etc/timezone)"
wine --version


# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')

# Run the Server
eval ${MODIFIED_STARTUP}
