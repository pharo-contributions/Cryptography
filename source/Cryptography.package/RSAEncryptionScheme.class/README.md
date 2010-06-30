Example:

| rsa pub priv rsaes c |
rsa := RSAKeyPairGenerator new.
rsa bits: 1024.
pub := rsa publicKey.
priv := rsa privateKey. 

rsaes := RSAEncryptionScheme new.
rsaes setPublicKey: pub privateKey: priv parameter: 'p'.

c := rsaes encrypt: 'hola'.
(rsaes decrypt: c) asString.

