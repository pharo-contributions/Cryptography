Class {
	#name : #CryptoPKCS12Test,
	#superclass : #TestCase,
	#category : 'PKCS12-Tests'
}

{ #category : #testing }
CryptoPKCS12Test >> test1 [

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 2 
		fromPassword: 'smeg' 
		salt: #(10 88 207 100 83 13 130 63)
		iterations: 1
		size: 8) hex.
	self assert: key = '79993dfe048d3b76'

]

{ #category : #testing }
CryptoPKCS12Test >> test10 [

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 1
		fromPassword: 'queeg' 
		salt: #(22 130 192 252 91 63 126 197)
		iterations: 1000
		size: 24) hex.
	self assert: key = '483dd6e919d7de2e8e648ba8f862f3fbfbdc2bcb2c02957f'

]

{ #category : #testing }
CryptoPKCS12Test >> test2 [

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 2 
		fromPassword: 'smeg' 
		salt: #(100 43 153 171 68 251 75 31)
		iterations: 1
		size: 8) hex.
	self assert: key = 'c0a38d64a79bea1d'

]

{ #category : #testing }
CryptoPKCS12Test >> test3 [

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 2 
		fromPassword: 'queeg' 
		salt: #(5 222 201 89 172 255 114 247)
		iterations: 1000
		size: 8) hex.
	self assert: key = '11dedad7758d4860'

]

{ #category : #testing }
CryptoPKCS12Test >> test4 [

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 2 
		fromPassword: 'queeg' 
		salt: #(22 130 192 252 91 63 126 197)
		iterations: 1000
		size: 8) hex.
	self assert: key = '9d461d1b00355c50'

]

{ #category : #testing }
CryptoPKCS12Test >> test5 [

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 3 
		fromPassword: 'smeg' 
		salt: #(61 131 192 228 84 106 193 64)
		iterations: 1
		size: 20) hex.
	self assert: key = '8d967d88f6caa9d714800ab3d48051d63f73a312'

]

{ #category : #testing }
CryptoPKCS12Test >> test6 [

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 3 
		fromPassword: 'queeg' 
		salt: #(38 50 22 252 194 250 179 28)
		iterations: 1000
		size: 20) hex.
	self assert: key = '5ec4c7a80df652294c3925b6489a7ab857c83476'

]

{ #category : #testing }
CryptoPKCS12Test >> test7 [

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 1
		fromPassword: 'smeg' 
		salt: #(10 88 207 100 83 13 130 63)
		iterations: 1
		size: 24) hex.
	self assert: key = '8aaae6297b6cb04642ab5b077851284eb7128f1a2a7fbca3'

]

{ #category : #testing }
CryptoPKCS12Test >> test8 [

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 1
		fromPassword: 'smeg' 
		salt: #(100 43 153 171 68 251 75 31)
		iterations: 1
		size: 24) hex.
	self assert: key = 'f3a95fec48d7711e985cfe67908c5ab79fa3d7c5caa5d966'

]

{ #category : #testing }
CryptoPKCS12Test >> test9 [

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 1
		fromPassword: 'queeg' 
		salt: #(5 222 201 89 172 255 114 247)
		iterations: 1000
		size: 24) hex.
	self assert: key = 'ed2034e36328830ff09df1e1a07dd357185dac0d4f9eb3d4'

]
