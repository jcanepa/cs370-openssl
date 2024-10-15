#! /usr/bin/env bash

# define variables
CIPHER="-aes-256-cbc"
KEY="D4868A7414674F78CF9B21259C43BDD348A747D8A84C4C88BDD1E5C58B1CFB01"
IV="8C82989CD4B8228A4C9660BCDCC1AEDC"
SALT="22766B9B6C151247"
PASS="memento"
E_FILE="encrypted-test.enc"
D_FILE="decrypted${CIPHER}.txt"

# decrypt the ciphertext file
openssl enc $CIPHER -d -in $E_FILE -out $D_FILE -K $KEY ${IV:+-iv $IV} -md md5 ${PASS:+-pass pass:$PASS} -provider legacy -provider default