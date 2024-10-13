#! /usr/bin/env bash

# Define variables
CIPHER="-bf-ecb" # -aes-128-cfb, bf-cbc
KEY="a3a02c24f886d7a6dba8633cb9fd08c2"
IV="15d82a74fe05c7919368040e5c6c27fc"
SALT="1d0f212b0d021b4b8e30ddcd5fc3d3a1"
PASS="sT8k"
P_FILE=""
E_FILE="newer_bf_ecb.enc"
D_FILE="decrypted.txt"

# display the plaintext message
# cat $P_FILE

# display the plain text in hex
# xxd -ps $P_FILE

# encrypt the plaintext file
# openssl enc $CIPHER -e -in $P_FILE -out $E_FILE -K $KEY ${IV:+-iv $IV} ${SALT:+-S $SALT}

# get the hex values to compare
# xxd -ps $E_FILE

# decrypt the ciphertext file
openssl enc $CIPHER -d -in $E_FILE -out $D_FILE -K $KEY ${IV:+-iv $IV} ${SALT:+-S $SALT} ${PASS:+-pass pass:$PASS}

# display the decrypted file
# cat ./$D_FILE

# clean up
# rm ./$E_FILE
# rm ./$D_FILE
