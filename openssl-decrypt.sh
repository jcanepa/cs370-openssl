#! /usr/bin/env bash

# Define variables
CIPHER="-aes-128-ecb"
KEY="6FAE6A22F99127D79B21D7A0F1949D14"
IV=""
SALT="1C578762DA631007"
PASS=""
E_FILE="aes-128-ecb.enc"
D_FILE="decrypted.txt"

# decrypt the ciphertext file
openssl enc $CIPHER -d -in $E_FILE -out $D_FILE -K $KEY ${IV:+-iv $IV} ${SALT:+-S $SALT} ${PASS:+-pass pass:$PASS}

# display the decrypted file
cat ./$D_FILE