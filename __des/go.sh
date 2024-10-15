#! /usr/bin/env bash

# define variables
CIPHER="des-ecb"
E_FILE="${CIPHER}.enc"
D_FILE="decrypted.jpg"
P_FILE="mw.jpg"
PASSWORD="liberty"

# decryption variables
KEY="03601D99A678A018"
IV=""
SALT="3A63AC23093020F7"

# encrypt the file
# echo openssl enc -e -${CIPHER} -salt -in ${P_FILE} -out ${E_FILE} -pass pass:${PASSWORD} -pbkdf2 -K ${KEY} -provider legacy -provider default -p

# # reveal the secrets
# openssl enc -${CIPHER} -salt -in ${P_FILE} -pass pass:${PASSWORD} -pbkdf2 -provider legacy -provider default -P | sed 's/ //g'
# echo "password=${PASSWORD}"

# decrypt the file
# rm ${D_FILE}
# echo openssl enc -d -${CIPHER} -S ${SALT} -in ${E_FILE} -out ${D_FILE} -pass pass:${PASSWORD} -pbkdf2 -K ${KEY} -provider legacy -provider default

# compare
# cat ${P_FILE}
# cat ${D_FILE}
# diff ${P_FILE} ${D_FILE}

# clean up
# rm ${D_FILE}
# rm ${E_FILE}