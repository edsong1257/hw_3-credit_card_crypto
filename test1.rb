require 'openssl'
require 'json'

document = "4916603231464963 Mar-30-2020 Soumya Ray Visa"
aes_crypt = "2c5f6f7a378978eb805f3bbf3162a18d","358f759a6377619f3887eb073ce905ab5c13067b63d88c1105fa702ac1e668108623f2f9d62f8fbf0e81796e960c44da"
key = "some text, how long"


iv, ciphertext =  JSON.parse(aes_crypt).map {|s| [s].pack("H*")}

    decipher = OpenSSL::Cipher::AES.new(128, :CBC)
    decipher.decrypt
    decipher.key = key
    decipher.iv = iv
    plain = decipher.update(ciphertext) + decipher.final
    return plain

