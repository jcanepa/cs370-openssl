#! /usr/bin/env bash

# define variables
CIPHER="-cast5-ofb"
P_FILE="plain.txt"
E_FILE="encrypted${CIPHER}.enc"
PASSWORD="mementomori"
CMD_OPTIONS="-provider legacy -provider default"

# encrypt the file
openssl enc $CIPHER -salt -in $P_FILE -out encrypted${CIPHER}.enc -pass pass:${PASSWORD} -pbkdf2 -provider legacy -provider default
# manually extract the key & iv, then spill all secrets
openssl enc -cast5-ofb -salt -in $P_FILE -pass pass:${PASSWORD} -pbkdf2 -provider legacy -provider default -P
echo "password=${PASSWORD}"

# decrypt the file
# openssl enc -d -aes-256-cbc -in encrypted-test.enc -out decrypted-test.txt -pass pass:password -pbkdf2

# compare the files
# diff plain.txt decrypted-test.txt

# clean up
# rm decrypted-test.txt