require 'openssl'
require 'json'

document = "4916603231464963 Mar-30-2020 Soumya Ray Visa"
key = "some text, how long"

cipher = OpenSSL::Cipher::AES.new(128, :CBC)
    cipher.encrypt
    cipher.key = key.to_s
    iv = cipher.random_iv
    ciphertext = cipher.update(document.to_s) + cipher.final
    puts [iv, ciphertext].map(){|s| s.unpack('H*')[0]}.to_json
