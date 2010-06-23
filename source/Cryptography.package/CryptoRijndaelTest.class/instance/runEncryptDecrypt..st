as yet unclassified
runEncryptDecrypt: blockCipherClass
	| msg key1 key2 enc1 enc2 dec1 dec2 ct2 ct1 |
	enc1 _ blockCipherClass key: (key1 _ SecureRandom picker nextBytes: 16).
	dec1 _ blockCipherClass key: key1.
	enc2 _ blockCipherClass key: (key2 _ SecureRandom picker nextBytes: 16).
	dec2 _ blockCipherClass key: key2.
	msg _ 'hello how are you?' asByteArray.
	ct2 _ enc2 encrypt: msg.
	self deny: msg = ct2.
	self assert: (dec2 decrypt: ct2) = msg.
	"ensure the cipher still works if its key is changed after creation, both for the encryptor instance and decryptor instance."
	enc1 key: key2.  dec1 key: key2.
	ct1 _ enc1 encrypt: msg.
	self assert: (dec1 decrypt: ct1) = msg