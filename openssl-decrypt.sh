#! /usr/bin/env bash

# Define variables
CIPHER="-bf-cbc"
KEY="AACEA9897DE38A386F744C35451CED29"
IV="57FE234E6033869E"
SALT="67C4437621DEDAC1"
PASS=""
E_FILE="encryption-protocols/ciphertext_bf/ciphertext_bf-cbc.enc"
D_FILE="decrypted.txt"

# decrypt the ciphertext file
openssl enc $CIPHER -d -in $E_FILE -out $D_FILE -K $KEY ${IV:+-iv $IV} ${SALT:+-S $SALT} ${PASS:+-pass pass:$PASS}

# display the decrypted file
cat ./$D_FILE