#! /usr/bin/env bash

# Define variables
CIPHER="-aes-128-ecb"
KEY="6FAE6A22F99127D79B21D7A0F1949D14"
IV=""
SALT="1C578762DA631007"
PASS=""
P_FILE="plaintext.txt"
E_FILE="aes-128-ecb.enc"
D_FILE="decrypted.txt"

# display the plaintext message
cat $P_FILE ; echo

# encrypt the plaintext file
openssl enc $CIPHER -e -in $P_FILE -out $E_FILE -K $KEY ${IV:+-iv $IV} ${SALT:+-S $SALT} ${PASS:+-pass pass:$PASS}

# decrypt the ciphertext file
openssl enc $CIPHER -d -in $E_FILE -out $D_FILE -K $KEY ${IV:+-iv $IV} ${SALT:+-S $SALT} ${PASS:+-pass pass:$PASS}

# display the decrypted file
cat ./$D_FILE ; echo

# verify match
diff $P_FILE $D_FILE

# clean up
rm ./$D_FILE
