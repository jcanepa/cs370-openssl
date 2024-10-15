#! /usr/bin/env bash

CIPHER="-cast5-ofb"
E_FILE="encrypted-test.txt"
D_FILE="decrypted-test.txt"
P_FILE="plain.txt"
PASSWORD="password"

# clean up
rm decrypted-test.txt
rm $E_FILE

# encrypt the file
openssl enc ${CIPHER} -salt -in ${P_FILE} -out ${E_FILE} -pass pass:${PASSWORD} -pbkdf2 -provider legacy -provider default

# reveal the secrets
openssl enc ${CIPHER} -salt -in ${P_FILE} -pass pass:${PASSWORD} -pbkdf2 -provider legacy -provider default -P | sed 's/ //g'
echo "password=${PASSWORD}"

# decrypt the file
openssl enc -d ${CIPHER} -in ${E_FILE} -out decrypted-test.txt -pass pass:${PASSWORD} -pbkdf2 -provider legacy -provider default

# compare
cat ${P_FILE}
cat decrypted-test.txt
diff ${P_FILE} decrypted-test.txt
