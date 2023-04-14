# #!/bin/bash
# cd /home/container

# # Information output
# echo "Running on Debian $(cat /etc/debian_version)"
# echo "Current timezone: $(cat /etc/timezone)"
# wine --version

if [[ ! -d "tmp" ]]; then
    mkdir tmp
    cd tmp/
    wget -nc https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe
    xvfb-run wine tmp/vcredist_x86.exe /q
    cd ../
fi

if [[ ! -d "vu" ]]; then
    mkdir -p vu/{client,instance}
    cd vu/client
    wget https://veniceunleashed.net/files/vu.zip
    unzip vu.zip
    rm vu.zip
fi
# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}