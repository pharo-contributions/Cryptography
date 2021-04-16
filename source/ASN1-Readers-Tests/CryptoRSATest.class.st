Class {
	#name : #CryptoRSATest,
	#superclass : #TestCase,
	#instVars : [
		'privateKey',
		'publicKey'
	],
	#category : #'ASN1-Readers-Tests'
}

{ #category : #RSA }
CryptoRSATest >> derKeys [

	| key64 |
	key64 := self encodedBase64Keys.
	^ key64 base64Decoded
]

{ #category : #RSA }
CryptoRSATest >> encodedBase64Keys [

	^ 'MIICXgIBAAKBgQDkI45GM6mYLlbxrKozE6bXWMoxvtVuIWOIF1KcGLED+4Gipriw
Nt0hkosuil513/CMjn9XBSZtaSsiIOLkXLZtbKYhATtvODR1nD/dl0JpFH7BLcD9
NGGRKOow0jg8fcPtXhLTy6Dsl7rfmVPJYuc4IlzZImTdErllmhzrTKT3YQIDAQAB
AoGBALPQjogomii3hZHQ3QmLGLqtYhjZaBH4wSF3+IXONF+GMcRIklNZuuuGPKt/
JjrUOh4fBqFJDuO3u+aXcx45MRMLVHuQIuUbegJXVS+rnxXI3I6I4SLBkoV7Jqn/
J9T9biOXrzq/xN8XVJQm7zq/FXaHR6l+Wo50LaBj7llY+CMBAkEA8bfsbySseTbI
D7tR/bytEz/DhQ1knKS3nFo83NYwDm7YcdGC+f0rQIUuS30lKApeoygBUiLOSs7K
euxEi6wC0QJBAPGePI59Fc5alAivyTkYdV4sbIL+SL5oXEERRyezogEgRqCGJtyd
MbnVviwREF4MiGTYQIIOx4aFrM/U4q9DL5ECQH+/QImMzEpTlXAbA74iFSZzMJYE
+gN/WjqbxkbAPC2kj2e33ozYLB+xQ0JKJXT/5fw8jFYoZvZKS+CjNabLhcECQQDp
bgrrToXGu1PRoKMzeiHKPfkIBUuaSZD3fA3WmYGmvNv/MhxRf70O4SW9xS6e7lTH
uPV5sXWqzXLLx8zJrotBAkEAgAoiR+5uOW9CgfWkblJ/YIgGbLiLQoFNZbwxXDfr
jcosTQvBjrc//rCnb2Pgm8QRGeN/CXKc9kKoWNqUQSYchQ==
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDkI45GM6mYLlbxrKozE6bXWMox
vtVuIWOIF1KcGLED+4GipriwNt0hkosuil513/CMjn9XBSZtaSsiIOLkXLZtbKYh
ATtvODR1nD/dl0JpFH7BLcD9NGGRKOow0jg8fcPtXhLTy6Dsl7rfmVPJYuc4IlzZ
ImTdErllmhzrTKT3YQIDAQAB'
]

{ #category : #tests }
CryptoRSATest >> genericRSATest: bits [

	| generator public private msg c |
	generator := RSAKeyPairGenerator new bits: bits.
	public := generator publicKey. "this may take a while"
	private := generator privateKey.

	msg := 1234567890987654321. "the plaintext"

	c := public crypt: msg. "the ciphertext (print it and take a look)"
	self assert: (private crypt: c) = msg
]

{ #category : #running }
CryptoRSATest >> setUp [

	| reader |
	super setUp.

	reader := RSAPrivateKeyFileReader new.
	reader decryptedBytes: self derKeys.
	privateKey := reader asPrivateKey.
	publicKey := reader asPublicKey
]

{ #category : #tests }
CryptoRSATest >> testRSA128 [

	self genericRSATest: 128
]

{ #category : #tests }
CryptoRSATest >> testRSA64 [

	self genericRSATest: 64
]

{ #category : #tests }
CryptoRSATest >> testRSASHASignVerification [

	| signBytes |
	signBytes := privateKey v15SignMessage: 'hello'.

	self assert: (publicKey v15Verify: signBytes isSignatureOf: 'hello')
]

{ #category : #tests }
CryptoRSATest >> testRSASHASigning [

	| signBytes |	

	signBytes := privateKey v15SignMessage: 'hello'.  

	self assert: signBytes = 
#[217 255 224 189 56 76 46 39 224 98 134 191 90 24 145 47 7 195 143 29 131 44 93 172 118 161 3 217 231 74 82 55 37 193 86 114 7 137 22 207 107 27 26 121 40 155 185 172 20 23 27 27 187 162 97 64 151 41 173 230 53 54 174 53 73 76 252 145 252 215 166 53 37 21 174 21 185 171 201 163 197 43 15 202 40 48 150 9 233 126 34 221 219 27 215 142 161 15 225 230 238 150 82 130 2 51 197 124 242 211 222 60 145 93 145 198 48 122 160 232 31 75 161 244 8 194 143 170]
]

{ #category : #tests }
CryptoRSATest >> testSignVerificationByGeneratedKeys [

	| signBytes gen |
	gen := RSAKeyPairGenerator bits: 1024.	
	gen computePrimes.
	
	signBytes := gen privateKey v15SignMessage: 'hello'.  
	
	self assert: (gen publicKey v15Verify: signBytes isSignatureOf: 'hello')
]
