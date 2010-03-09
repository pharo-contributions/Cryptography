tests
testRFC3602Case1
	"this test comes from RFC3602 http://www.faqs.org/rfcs/rfc3602.html
	Case #1: Encrypting 16 bytes (1 block) using AES-CBC with 128-bit key
	Key : 0x06a9214036b8a15b512e03d534120006
	IV : 0x3dafba429d9eb430b422da802c9fac41
	Plaintext : 'Single block msg'
	Ciphertext: 0xe353779c1079aeb82708942dbe77181a"
	| result |
	((CBC on: (Rijndael new keySize: 16;
			 key: (ByteArray fromHexString: '06A9214036B8A15B512E03D534120006')))
		initialVector: (ByteArray fromHexString: '3DAFBA429D9EB430B422DA802C9FAC41'))
		encryptBlock: (result := 'Single block msg' asByteArray).
	self assert: result hex = 'E353779C1079AEB82708942DBE77181A'