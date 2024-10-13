#! /usr/bin/env bash

# Define variables
CIPHER="-aes-128-ecb" # -aes-128-cfb, bf-cbc
KEY="c705fe21632c4031808148d9bbe069f9"
IV="" # not used for this cipher
SALT="" # not used for this cipher
P_FILE="plaintext.txt"
E_FILE="ciphertext.enc"
D_FILE="decrypted.txt"


# display the plaintext message
cat ./$P_FILE

# display the plain text in hex
xxd -ps $P_FILE

# encrypt the plaintext file
openssl enc $CIPHER -e -in $P_FILE -out $E_FILE -K $KEY ${IV:+-iv $IV} ${SALT:+-S $SALT}

# get the hex values to compare
xxd -ps $E_FILE

# decrypt the ciphertext file
openssl enc $CIPHER -d -in $E_FILE -out $D_FILE -K $KEY ${IV:+-iv $IV} ${SALT:+-S $SALT}

# display the decrypted file
cat ./$D_FILE

# clean up
# rm ./$E_FILE
# rm ./$D_FILE
