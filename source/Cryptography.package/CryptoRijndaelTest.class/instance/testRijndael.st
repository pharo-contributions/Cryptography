block ciphers
testRijndael
	| rijndael vector |
	rijndael := Rijndael new keySize: 16; key: (0 to: 15) asByteArray.
	vector := (0 to: 15) asByteArray.
	rijndael encryptBlock: vector.
	self assert: vector hex = '0A940BB5416EF045F1C39458C653EA5A'.
	rijndael decryptBlock: vector.
	self assert: vector hex = '000102030405060708090A0B0C0D0E0F'.

	rijndael := Rijndael new blockSize: 16; keySize: 24.
	rijndael key: (0 to: 16r17) asByteArray.
	vector := (0 to: 15) asByteArray.
	rijndael encryptBlock: vector.
	self assert: vector hex = '0060BFFE46834BB8DA5CF9A61FF220AE'.
	rijndael decryptBlock: vector.
	self assert: vector hex = '000102030405060708090A0B0C0D0E0F'.

	rijndael := Rijndael new blockSize: 16; keySize: 32.
	rijndael key: (0 to: 16r1F) asByteArray.
	vector := (0 to: 15) asByteArray.
	rijndael encryptBlock: vector.
	self assert: vector hex = '5A6E045708FB7196F02E553D02C3A692'.
	rijndael decryptBlock: vector.
	self assert: vector hex = '000102030405060708090A0B0C0D0E0F'