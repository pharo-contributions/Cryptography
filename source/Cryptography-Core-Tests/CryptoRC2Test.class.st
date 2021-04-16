Class {
	#name : #CryptoRC2Test,
	#superclass : #TestCase,
	#category : #'Cryptography-Core-Tests-RC2'
}

{ #category : #testing }
CryptoRC2Test >> genericARC2TestKey: key effectiveKeyLength: aLength plaintext: plainText ciphertext: ciphertext [

	| vector rc2 |
	vector := plainText copy.
	rc2 := ARC2 key: key effectiveKeyLength: aLength.
	rc2 encryptBlock: vector.
	self assert: vector equals: ciphertext.

	rc2 decryptBlock: vector.
	self assert: vector equals: plainText.
	rc2 destroy
]

{ #category : #testing }
CryptoRC2Test >> testARC2 [
	" All quantities are given in hexadecimal notation.

   Key length (bytes) = 8
   Effective key length (bits) = 63
   Key = 00000000 00000000
   Plaintext = 00000000 00000000
   Ciphertext = ebb773f9 93278eff "
	
	self genericARC2TestKey: (ByteArray readHexFrom: '0000000000000000') effectiveKeyLength: 63 plaintext: (ByteArray  readHexFrom: '0000000000000000') ciphertext: (ByteArray readHexFrom: 'ebb773f993278eff').

   "Key length (bytes) = 8
   Effective key length (bits) = 64
   Key = ffffffff ffffffff
   Plaintext = ffffffff ffffffff
   Ciphertext = 278b27e4 2e2f0d49"

	self genericARC2TestKey: (ByteArray readHexFrom: 'ffffffffffffffff') effectiveKeyLength: 64 plaintext: (ByteArray  readHexFrom: 'ffffffffffffffff') ciphertext: (ByteArray readHexFrom: '278b27e42e2f0d49').
  
   "Key length (bytes) = 8
   Effective key length (bits) = 64
   Key = 30000000 00000000
   Plaintext = 10000000 00000001
   Ciphertext = 30649edf 9be7d2c2"

	self genericARC2TestKey: (ByteArray readHexFrom: '3000000000000000') effectiveKeyLength: 64 plaintext: (ByteArray  readHexFrom: '1000000000000001') ciphertext: (ByteArray readHexFrom: '30649edf9be7d2c2').

   "Key length (bytes) = 1
   Effective key length (bits) = 64
   Key = 88
   Plaintext = 00000000 00000000
   Ciphertext = 61a8a244 adacccf0"

	self genericARC2TestKey: (ByteArray readHexFrom: '88') effectiveKeyLength: 64 plaintext: (ByteArray readHexFrom: '0000000000000000') ciphertext: (ByteArray readHexFrom: '61a8a244adacccf0').

   "Key length (bytes) = 7
   Effective key length (bits) = 64
   Key = 88bca90e 90875a
   Plaintext = 00000000 00000000
   Ciphertext = 6ccf4308 974c267f"

	self genericARC2TestKey: (ByteArray readHexFrom: '88bca90e90875a') effectiveKeyLength: 64 plaintext: (ByteArray readHexFrom: '0000000000000000') ciphertext: (ByteArray readHexFrom: '6ccf4308974c267f').

   "Key length (bytes) = 16
   Effective key length (bits) = 64
   Key = 88bca90e 90875a7f 0f79c384 627bafb2
   Plaintext = 00000000 00000000
   Ciphertext = 1a807d27 2bbe5db1"

	self genericARC2TestKey: (ByteArray readHexFrom: '88bca90e90875a7f0f79c384627bafb2') effectiveKeyLength: 64 plaintext: (ByteArray readHexFrom: '0000000000000000') ciphertext: (ByteArray readHexFrom: '1a807d272bbe5db1').

   "Key length (bytes) = 16
   Effective key length (bits) = 128
   Key = 88bca90e 90875a7f 0f79c384 627bafb2
   Plaintext = 00000000 00000000
   Ciphertext = 2269552a b0f85ca6"

	self genericARC2TestKey: (ByteArray readHexFrom: '88bca90e90875a7f0f79c384627bafb2') effectiveKeyLength: 128 plaintext: (ByteArray readHexFrom: '0000000000000000') ciphertext: (ByteArray readHexFrom: '2269552ab0f85ca6').

   "Key length (bytes) = 33
   Effective key length (bits) = 129
   Key = 88bca90e 90875a7f 0f79c384 627bafb2 16f80a6f 85920584
         c42fceb0 be255daf 1e
   Plaintext = 00000000 00000000
   Ciphertext = 5b78d3a4 3dfff1f1"

	self genericARC2TestKey: (ByteArray readHexFrom: '88bca90e90875a7f0f79c384627bafb216f80a6f85920584c42fceb0be255daf1e') effectiveKeyLength: 129 plaintext: (ByteArray readHexFrom: '0000000000000000') ciphertext: (ByteArray readHexFrom: '5b78d3a43dfff1f1').
]
