Extension { #name : #ThirtyTwoBitRegister }

{ #category : #'*Cryptography-Core-core-instance creation' }
ThirtyTwoBitRegister class >> byte1: hi1 byte2: hi2 byte3: low1 byte4: low2 [
	^ super new byte1: hi1 byte2: hi2 byte3: low1 byte4: low2
]

{ #category : #'*Cryptography-Core-core-instance creation' }
ThirtyTwoBitRegister class >> loadFrom: aByteArray at: index [
	^ super new loadFrom: aByteArray at: index
]
