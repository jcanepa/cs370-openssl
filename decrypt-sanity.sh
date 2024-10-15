#! /usr/bin/env bash

# Define variables
CIPHER="-aes-128-cbc"
KEY="D5F44B89F29D48E35EBA2B2061D3CBD2"
IV="F0A85676E48DD5EF04046C709385BF4D"
SALT="C3DBC89B25466EC4"
PASS=""
E_FILE="encryption-protocols/ciphertext.AES-128-CBC.enc"
D_FILE="decrypted${CIPHER}.png"

# decrypt the ciphertext file
openssl enc $CIPHER -d -in $E_FILE -out $D_FILE -K $KEY ${IV:+-iv $IV} ${PASS:+-pass pass:$PASS} -provider legacy -provider default

# cat $D_FILE ; echo