#! /usr/bin/env bash

# define variables
CIPHER="-cast5-ofb"
P_FILE="plain.txt"
E_FILE="encrypted${CIPHER}.enc"
PASSWORD="memento"

# encrypt a txt file,
# using a given cipher,
# given some user-provided password,
# and generating key, salt, and iv for us!
openssl enc $CIPHER -salt -in $P_FILE -out $E_FILE -pass pass:$PASSWORD -P -pbkdf2 -provider legacy -provider default