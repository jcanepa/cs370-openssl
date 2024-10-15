#! /usr/bin/env bash

# define variables
CIPHER="-cast5-ofb"
P_FILE="plain.txt"
E_FILE="encrypted${CIPHER}.enc"
PASSWORD="memento"

# encrypt the file
openssl enc $CIPHER -salt -in plain.txt -out encrypted-test.enc -pass pass:${PASSWORD} -pbkdf2 -provider legacy -provider default

# decrypt the file
# openssl enc -d -aes-256-cbc -in encrypted-test.enc -out decrypted-test.txt -pass pass:password -pbkdf2

# compare the files
# diff plain.txt decrypted-test.txt

# clean up
# rm decrypted-test.txt