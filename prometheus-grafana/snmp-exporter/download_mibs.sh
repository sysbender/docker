#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

MIBDIR="mibs"
CURL_OPTS="-L -sS --retry 3 --retry-delay 3 --fail"
CURL_USER_AGENT="-H \"User-Agent: snmp_exporter generator\""

# Define URLs
MIB_URLS=(
    "https://download.schneider-electric.com/files?p_File_Name=powernet452.mib&p_Doc_Ref=APC_POWERNETMIB_452_EN&p_enDocType=Firmware"
    "https://www.arista.com/assets/data/docs/MIBS/ARISTA-ENTITY-SENSOR-MIB.txt"
    "https://www.arista.com/assets/data/docs/MIBS/ARISTA-SMI-MIB.txt"
    "https://www.arista.com/assets/data/docs/MIBS/ARISTA-SW-IP-FORWARDING-MIB.txt"
    "https://raw.githubusercontent.com/cisco/cisco-mibs/f55dc443daff58dfc86a764047ded2248bb94e12/v2/AIRESPACE-REF-MIB.my"
    "https://raw.githubusercontent.com/cisco/cisco-mibs/f55dc443daff58dfc86a764047ded2248bb94e12/v2/AIRESPACE-WIRELESS-MIB.my"
    "https://dl.dell.com/FOLDER11196144M/1/Dell-OM-MIBS-11010_A00.zip"
    "https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1580676047/v229101/upd11.85mib.tar.gz"
    "https://www.iana.org/assignments/ianacharset-mib/ianacharset-mib"
    "https://www.iana.org/assignments/ianaiftype-mib/ianaiftype-mib"
    "https://www.iana.org/assignments/ianaprinter-mib/ianaprinter-mib"
    "https://raw.githubusercontent.com/acassen/keepalived/v2.2.8/doc/KEEPALIVED-MIB.txt"
    "https://raw.githubusercontent.com/acassen/keepalived/v2.2.8/doc/VRRP-MIB.txt"
    "https://raw.githubusercontent.com/acassen/keepalived/v2.2.8/doc/VRRPv3-MIB.txt"
    "https://dl.ubnt.com/firmwares/airos-ubnt-mib/ubnt-mib.zip"
)

# Create MIB directory if it does not exist
mkdir -p "$MIBDIR"

# Function to download a MIB file
download_mib() {
    local url="$1"
    local filename="$MIBDIR/$(basename "$url")"
    echo "Downloading $filename..."
    curl $CURL_OPTS $CURL_USER_AGENT -o "$filename" "$url"
}

# Loop through URLs and download each MIB
for url in "${MIB_URLS[@]}"; do
    download_mib "$url"
done

echo "All MIBs downloaded successfully."
