#! /usr/bin/env bash

# Define variables
CIPHER="-camellia-128-ecb"
KEY="100F15BBF72702AA37153F406F16E0FA"
IV=""
SALT="810C6E944A0B5E81"
PASS=""
E_FILE="encryption-protocols/ciphertext_camellia/ciphertext_camellia-128-ecb.enc"
D_FILE="decrypted.txt"

# decrypt the ciphertext file
openssl enc $CIPHER -d -in $E_FILE -out $D_FILE -K $KEY ${IV:+-iv $IV} ${SALT:+-S $SALT} ${PASS:+-pass pass:$PASS} -provider legacy -provider default

# Check the file type
if file decrypted.txt | grep -q "image"; then
    echo "This is an image file"
    mv decrypted.txt decrypted.png
    cp decrypted.png decrypted.jpg
else
    echo "Unknown file type"
fi