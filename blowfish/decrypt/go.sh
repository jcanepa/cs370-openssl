#! /usr/bin/env bash

# define variables
CIPHER="bf-cbc"
E_FILE="${CIPHER}.enc"
D_FILE="decrypted.txt"
KEY="8123456789eBC7EFb123a563"
IV="023a5631"

# openssl enc -d -${CIPHER} -in ${E_FILE} -out ${D_FILE} $KEY $IV -pbkdf2 -provider legacy -provider default
openssl enc -d -${CIPHER} -in ${E_FILE} -out ${D_FILE} -pbkdf2 -provider legacy -provider default
