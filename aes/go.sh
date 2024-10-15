#! /usr/bin/env bash
CIPHER="-aes-256-cbc"
E_FILE="encrypted-test.txt"
D_FILE="encrypted-test.txt"
P_FILE="plain.txt"
PASSWORD="password"

# encrypt the file
openssl enc ${CIPHER} -salt -in plain.txt -out ${E_FILE} -pass pass:password -pbkdf2

# extract the secrets
openssl enc ${CIPHER} -salt -in $P_FILE -pass pass:${PASSWORD} -pbkdf2 -provider legacy -provider default -P

# decrypt the file
openssl enc -d ${CIPHER} -in ${E_FILE} -out decrypted-test.txt -pass pass:password -pbkdf2

# cat plain.txt
cat plain.txt
cat decrypted-test.txt

# # compare files
diff plain.txt decrypted-test.txt

# # clean up
rm decrypted-test.txt
rm $E_FILE
