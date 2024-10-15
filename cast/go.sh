#! /usr/bin/env bash
CIPHER="-aes-256-cbc"
E_FILE="encrypted-test.txt"
D_FILE="decrypted-test.txt"
P_FILE="plain.txt"
PASSWORD="password"


# encrypt the file
openssl enc ${CIPHER} -salt -in ${P_FILE} -out ${E_FILE} -pass pass:${PASSWORD} -pbkdf2

# reveal the secrets
openssl enc ${CIPHER} -salt -in ${P_FILE} -pass pass:${PASSWORD} -pbkdf2 -provider legacy -provider default -P | sed 's/ //g'
echo "password=${PASSWORD}"

# decrypt the file
openssl enc -d ${CIPHER} -in ${E_FILE} -out decrypted-test.txt -pass pass:${PASSWORD} -pbkdf2

# compare
cat ${P_FILE}
cat decrypted-test.txt
diff ${P_FILE} decrypted-test.txt

# # clean up
rm decrypted-test.txt
rm $E_FILE
