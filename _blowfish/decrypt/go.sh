#! /usr/bin/env bash

# define variables
CIPHER="bf-cbc"
E_FILE="megan-bf-cbc.enc"
D_FILE="decrypted.txt"
KEY="8123456789eBC7EFb123a563"
IV="023a5631"

openssl enc -d -${CIPHER} -in ${E_FILE} -out ${D_FILE} -K 8123456789eBC7EFb123a563 -iv 023a5631 -provider legacy -provider default
