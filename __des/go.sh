#! /usr/bin/env bash

# define variables
CIPHER="des-ecb"
E_FILE="${CIPHER}.enc"
D_FILE="decrypted.jpg"
P_FILE="mw.jpg"
PASSWORD="liberty"

# decryption variables
KEY="171C420438C1D748"
IV=""
SALT="8E697191894AA304"

# encrypt the file
openssl enc -${CIPHER} -salt -in ${P_FILE} -out ${E_FILE} -pass pass:${PASSWORD} -pbkdf2 -provider legacy -provider default

# reveal the secrets
openssl enc -${CIPHER} -salt -in ${P_FILE} -pass pass:${PASSWORD} -pbkdf2 -provider legacy -provider default -P | sed 's/ //g'
echo "password=${PASSWORD}"

# decrypt the file
# rm ${D_FILE}
# openssl enc -d -${CIPHER} -in ${E_FILE} -out ${D_FILE} -pass pass:${PASSWORD} -pbkdf2 -K ${KEY} -provider legacy -provider default

# compare
# cat ${P_FILE}
# cat ${D_FILE}
# diff ${P_FILE} ${D_FILE}

# clean up
# rm ${D_FILE}
# rm ${E_FILE}