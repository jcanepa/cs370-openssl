#! /usr/bin/env bash

# Define variables
CIPHER="-cast5-ofb"
KEY="2072ddab20dc1c6bdd4d9f555d06a8c4"
IV="e89c38c160b699b4c879728528305763"
SALT="bdc4fe0dd039e7aa"
PASS="secret"
P_FILE="plaintext.txt"
E_FILE="encrypted_cast5-ofb.enc"
D_FILE="decrypted${CIPHER}.txt"

# display the plaintext message
cat $P_FILE ; echo

# encrypt the plaintext file
openssl enc $CIPHER -e -salt -in $P_FILE -out $E_FILE -K $KEY ${IV:+-iv $IV} ${SALT:+-S $SALT} -md md5 ${PASS:+-pass pass:$PASS} -provider legacy -provider default

# decrypt the ciphertext file
openssl enc $CIPHER -d -in $E_FILE -out $D_FILE -K $KEY ${IV:+-iv $IV} ${SALT:+-S $SALT} -md md5 ${PASS:+-pass pass:$PASS} -provider legacy -provider default

# display the decrypted file
cat ./$D_FILE ; echo

# verify match
diff $P_FILE $D_FILE

# clean up
rm ./$D_FILE
