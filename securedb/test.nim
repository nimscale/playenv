import nimscale.crypt
import strutils
let enc = crypt.newSymmetricEncoder(secret="123",compress=true)

# echo $enc.encrypt("test")
echo $enc.decrypt(enc.encrypt("test"))

var i = 0
echo 1

var c=strutils.repeat("a",1000)

while i<100000:
    var r = $enc.decrypt(enc.encrypt(c))
    i.inc
echo 2
# enc.open(secret="1234")
#
# echo enc.encrypt("test")
#


# from leveldb import nil

# import nimscale.text as ntext
# echo ntext.padMultiple16("12345678901234566")

# import nimscale.secure as securedb
# from options import nil


# # var db : securedb.SecureDB
# var path = ""
# var db=securedb.open(secret="mypasswd",path=path)
#
# db.put("hello","world")
# echo options.get(db.get("hello"))
#


#
# echo db.exists("hello")

#
# import strutils
#
# import libsodium.sodium
# import libsodium.sodium_sizes
# import os
#
#
# let msg = "hello and goodbye"
# var pk1 = ""
# var sk1="" #secret key
# var pk2 = ""
# var sk2="" #secret key
#
#
# var nonce=""
# var ciphertext=""
#
# #1 is sender
# (pk2, sk2) = crypto_box_keypair()
#
# var passphrase= paramStr(1)
#
# type KeyPair =  tuple[x, y: string]
#
# proc generateKeys(name:string)=
#     (pk1, sk1) = crypto_box_keypair()
#     writeFile(name&".pub", pk1)
#     writeFile(name&".priv", sk1)
#
#
# proc loadKeys(name:string): KeyPair =
#     var path=name&".pub"
#     var res: KeyPair
#     if existsFile(path):
#         res[0]= readFile(path)
#     else:
#         generateKeys(name)
#         return loadKeys(name)
#     path=name&".priv"
#     if existsFile(path):
#         res[1]= readFile(path)
#     else:
#         raise newException(OSError, "found public key but not the private key, this should not be the case")
#     return res
#
# var res: StrArray
# res=loadKeys("kristof")
#
#
#
# nonce = randombytes(crypto_box_NONCEBYTES())
# echo len(nonce)
# ciphertext = crypto_box_easy(msg, nonce, pk2, sk1)
#
# echo "unencr"
# echo msg
#
# echo "encrypted"
# echo ciphertext
#
# var data =""
# data = nonce & ciphertext
#
# #data is send over the wire
# nonce=substr(data,0,23)
# ciphertext=substr(data,24,len(data))
#
# let orig = crypto_box_open_easy(ciphertext, nonce, pk1, sk2)
#
# echo "decrypted"
# echo orig
# # assert orig == msg
# # FIXME let sig = sign(sk, "hello")
# #assert sig.len == 64
