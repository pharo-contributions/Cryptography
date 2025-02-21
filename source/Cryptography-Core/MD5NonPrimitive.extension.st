Extension { #name : #MD5NonPrimitive }

{ #category : #'*Cryptography-Core' }
MD5NonPrimitive >> finalHash [
	"Concatenate the state values to produce the 128-bite result"
	
	^ (state at: 1) asByteArray, (state at: 2) asByteArray, (state at: 3) asByteArray, (state at: 4) asByteArray
]

{ #category : #'*Cryptography-Core' }
MD5NonPrimitive >> initializeState [
	"Some magic numbers to get the process started"
	
	state := OrderedCollection newFrom: {
		(ThirtyTwoBitRegister new load: 16r67452301).
		(ThirtyTwoBitRegister new load: 16rEFCDAB89).
		(ThirtyTwoBitRegister new load: 16r98BADCFE).
		(ThirtyTwoBitRegister new load: 16r10325476)}.


]
