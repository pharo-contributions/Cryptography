Class {
	#name : #CryptoRigndaelCBCTest,
	#superclass : #TestCase,
	#category : #'Cryptography-Core-Tests-Rijndael'
}

{ #category : #tests }
CryptoRigndaelCBCTest >> testByteArrayFromHexString [

	"this test requres that the cryptography core method fromHexString be loaded the main purpose of the method fromHexString is to
	ensure leading zeros are not chopped off and that small case letters in hex strings are allowed"

	self
		assert: (ByteArray readHexFrom:
				 '000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f')
				storeString
		equals:
		'#[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31]'.
	self
		assert: (ByteArray readHexFrom:
				 '000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f')
				storeString
		equals:
		'#[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31]'
]

{ #category : #tests }
CryptoRigndaelCBCTest >> testRFC3602Case1 [

	"this test comes from RFC3602 http://www.faqs.org/rfcs/rfc3602.html
	Case #1: Encrypting 16 bytes (1 block) using AES-CBC with 128-bit key
	Key : 0x06a9214036b8a15b512e03d534120006
	IV : 0x3dafba429d9eb430b422da802c9fac41
	Plaintext : 'Single block msg'
	Ciphertext: 0xe353779c1079aeb82708942dbe77181a"

	| result |
	((CBC on: (Rijndael new
			   keySize: 16;
			   key: (ByteArray readHexFrom: '06a9214036b8a15b512e03d534120006'))) 
		 initialVector:
		 (ByteArray readHexFrom: '3dafba429d9eb430b422da802c9fac41')) 
		encryptBlock: (result := 'Single block msg' asByteArray).
	self assert: result hex equals: 'e353779c1079aeb82708942dbe77181a'
]

{ #category : #tests }
CryptoRigndaelCBCTest >> testRFC3602Case2 [

	"this test comes from RFC3602 http://www.faqs.org/rfcs/rfc3602.html
	Case #2: Encrypting 32 bytes (2 blocks) using AES-CBC with 128-bit key
	Key       : 0xc286696d887c9aa0611bbb3e2025a45a
	IV        : 0x562e17996d093d28ddb3ba695a2e6f58
	Plaintext : 0x000102030405060708090a0b0c0d0e0f
              101112131415161718191a1b1c1d1e1f
	Ciphertext: 0xd296cd94c2cccf8a3a863028b5e1dc0a
              7586602d253cfff91b8266bea6d61ab1"

	| result |
	result := ((CBC on: (Rijndael new
			             keySize: 16;
			             key:
				             (ByteArray readHexFrom:
						              'c286696d887c9aa0611bbb3e2025a45a'))) 
		           initialVector:
		           (ByteArray readHexFrom:
			            '562e17996d093d28ddb3ba695a2e6f58')) encrypt:
		          (result := ByteArray readHexFrom:
			                     '000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f').
	self
		assert: result hex
		equals:
		'd296cd94c2cccf8a3a863028b5e1dc0a7586602d253cfff91b8266bea6d61ab1bcfd81022202366bde6dd260a15841a1'
]

{ #category : #tests }
CryptoRigndaelCBCTest >> testRFC3602Case3 [

	"this test comes from RFC3602 http://www.faqs.org/rfcs/rfc3602.html
	Case #3: Encrypting 48 bytes (3 blocks) using AES-CBC with 128-bit key
	Key : 0x6c3ea0477630ce21a2ce334aa746c2cd
	IV : 0xc782dc4c098c66cbd9cd27d825682c81
	Plaintext : This is a 48-byte message (exactly 3 AES blocks)
	Ciphertext: 0xd0a02b3836451753d493665d33f0e886
	2dea54cdb293abc7506939276772f8d5
	021c19216bad525c8579695d83ba2684"

	| result |
	result := ((CBC on: (Rijndael new
			             keySize: 16;
			             key:
				             (ByteArray readHexFrom:
						              '6c3ea0477630ce21a2ce334aa746c2cd'))) 
		           initialVector:
		           (ByteArray readHexFrom:
			            'c782dc4c098c66cbd9cd27d825682c81')) encrypt:
		          'This is a 48-byte message (exactly 3 AES blocks)'
			          asByteArray.
	self
		assert: result hex
		equals:
		'd0a02b3836451753d493665d33f0e8862dea54cdb293abc7506939276772f8d5021c19216bad525c8579695d83ba2684d248b3e0f2388c137102846eb06272ff'
]

{ #category : #tests }
CryptoRigndaelCBCTest >> testRFC3602Case4 [

	"this test comes from RFC3602 http://www.faqs.org/rfcs/rfc3602.html
	Case #4: Encrypting 64 bytes (4 blocks) using AES-CBC with 128-bit key
	Key       : 0x56e47a38c5598974bc46903dba290349
	IV        : 0x8ce82eefbea0da3c44699ed7db51b7d9
	Plaintext : 0xa0a1a2a3a4a5a6a7a8a9aaabacadaeaf
              b0b1b2b3b4b5b6b7b8b9babbbcbdbebf
              c0c1c2c3c4c5c6c7c8c9cacbcccdcecf
              d0d1d2d3d4d5d6d7d8d9dadbdcdddedf
	Ciphertext: 0xc30e32ffedc0774e6aff6af0869f71aa
              0f3af07a9a31a9c684db207eb0ef8e4e
              35907aa632c3ffdf868bb7b29d3d46ad
              83ce9f9a102ee99d49a53e87f4c3da55
"

	| result |
	result := ((CBC on: (Rijndael new
			             keySize: 16;
			             key:
				             (ByteArray readHexFrom:
						              '56e47a38c5598974bc46903dba290349'))) 
		           initialVector:
		           (ByteArray readHexFrom:
			            '8ce82eefbea0da3c44699ed7db51b7d9')) encrypt:
		          (ByteArray readHexFrom:
			           'a0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedf').
	self
		assert: result hex
		equals:
		'c30e32ffedc0774e6aff6af0869f71aa0f3af07a9a31a9c684db207eb0ef8e4e35907aa632c3ffdf868bb7b29d3d46ad83ce9f9a102ee99d49a53e87f4c3da5578b8d04731041aa2d9787ca4a4fa3eef'
]
