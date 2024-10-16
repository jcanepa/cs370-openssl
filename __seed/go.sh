openssl enc -e -seed-cfb -in mw.jpg -out seed-cfb.enc -pass pass:liberty -pbkdf2 -K 03601D99A678A018 -provider legacy -provider default -p
openssl enc -d -seed-cfb -in ciphertext_seed-cfb.enc -out decrypted.jpg -K 7635054 -iv 9857463 -provider legacy -provider default

PASSWORD="-pass pass:liberty -pbkdf2"
FOO="-provider legacy -provider default"

openssl enc -e -seed-cfb -in plain.png -out cipertext_seed-cfb.enc -pass pass:grow -pbkdf2 -provider legacy -provider default
openssl enc -d -seed-cfb -in cipertext_seed-cfb.enc -out decrypted_seed-cfb.png -pass pass:liberty -pbkdf2 -provider legacy -provider default