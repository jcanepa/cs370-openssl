#! /usr/bin/env bash

# Define variables
CIPHER="-cast-cbc"
KEY="854D81D270B8DAB970C18D47FC999C70"
IV="B624DF51A17F7BD9"
SALT="3B6514F5B2404FE0"
PASS=""
E_FILE="encryption-protocols/ciphertext_cast/ciphertext_cast-cbc.enc"
D_FILE="decrypted${CIPHER}.txt"

# decrypt the ciphertext file
openssl enc $CIPHER -d -in $E_FILE -out $D_FILE -K $KEY ${IV:+-iv $IV} ${PASS:+-pass pass:$PASS} -provider legacy

cat $D_FILE ; echo