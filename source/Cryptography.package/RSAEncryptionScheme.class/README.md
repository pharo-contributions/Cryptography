Example:

| rsa pub priv rsaes c |
rsa _ RSAKeyPairGenerator new.
rsa bits: 1024.
pub _ rsa publicKey.
priv _ rsa privateKey. 

rsaes _ RSAEncryptionScheme new.
rsaes setPublicKey: pub privateKey: priv parameter: 'p'.

c _ rsaes encrypt: 'hola'.
(rsaes decrypt: c) asString.

