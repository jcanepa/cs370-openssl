#! /usr/bin/env bash

# define variables
CIPHER="des-ecb"
E_FILE="${CIPHER}.enc"
D_FILE="decrypted.png"
P_FILE="text.png"
PASSWORD="osssss"

# decryption variables
KEY="97F5551A43067975"
IV="EE0964A8C9C27F3E"
SALT="05D13F165032E7F1"

# encrypt the file
# openssl enc -${CIPHER} -salt -in ${P_FILE} -out ${E_FILE} -pass pass:${PASSWORD} -pbkdf2 -provider legacy -provider default

# reveal the secrets
# openssl enc -${CIPHER} -salt -in ${P_FILE} -pass pass:${PASSWORD} -pbkdf2 -provider legacy -provider default -P | sed 's/ //g'
# echo "password=${PASSWORD}"

# decrypt the file
openssl enc -d -${CIPHER} -in ${E_FILE} -out ${D_FILE} -K ${KEY} -iv ${IV} -provider legacy -provider default

# compare
# cat ${P_FILE}
# cat ${D_FILE}
# diff ${P_FILE} ${D_FILE}

# clean up
# rm ${D_FILE}
# rm ${E_FILE}