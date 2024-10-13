#! /usr/bin/env bash

# Define variables
CIPHER="-des-ecb"
KEY="2EB034E7B3F6C5A5"
IV=""
SALT="A3F4D4A349C6E3DC"
PASS=""
E_FILE="encryption-protocols/ciphertext_des/ciphertext_des-ecb.enc"
D_FILE="decrypted${CIPHER}.txt"

# decrypt the ciphertext file
openssl enc $CIPHER -d -in $E_FILE -out $D_FILE -K $KEY ${IV:+-iv $IV} ${SALT:+-S $SALT} ${PASS:+-pass pass:$PASS} -provider legacy -provider default

cat $D_FILE ; echo