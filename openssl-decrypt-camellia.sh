#! /usr/bin/env bash

# Define variables
CIPHER="-camellia-128-cbc"
KEY="228CD834ACF1178648B9CC87E634D49A"
IV="8AC25C344D1B348F11BF5067A7245B6F"
SALT="3C72B2C79C665D0F"
PASS=""
E_FILE="encryption-protocols/ciphertext_camellia/ciphertext_camellia-128-cbc.enc"
D_FILE="decrypted${CIPHER}.txt"

# decrypt the ciphertext file
openssl enc $CIPHER -d -in $E_FILE -out $D_FILE -K $KEY ${IV:+-iv $IV} ${PASS:+-pass pass:$PASS} -provider legacy

cat $D_FILE ; echo