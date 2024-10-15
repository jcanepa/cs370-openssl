#! /usr/bin/env bash

# encrypt the file
openssl enc -aes-256-cbc -salt -in plain.txt -out encrypted-test.enc -pass pass:password -pbkdf2

# decrypt the file
openssl enc -d -aes-256-cbc -in encrypted-test.enc -out decrypted-test.txt -pass pass:password -pbkdf2
