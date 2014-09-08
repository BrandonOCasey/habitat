#! /bin/sh

if [ -z "$1" ] || [ -z "$2" ]; then
    exit 2
fi
url="$1"; shift;
save_location="$1"; shift;

if command -v 'wget' > /dev/null;then
    wget -O "$save_location" "$url" -q --no-check-certificate
elif command -v 'curl' > /dev/null; then
    curl -o "$save_location" "$url" -q
elif command -v 'w3m' > /dev/null; then
    w3m -dump "$url" > "$save_location"
elif command -v 'lynx' > /dev/null; then
    lynx -dump "$url" > "$save_location"
else
    echo "We require curl, wget, lynx, or w3m to use the download function"
    exit 2
fi