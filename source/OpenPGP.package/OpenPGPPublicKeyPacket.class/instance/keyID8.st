accessing
keyID8
	^(self version <= 3
		ifTrue: [self mpis first]
		ifFalse: [self fingerprint]) bitAnd: 16rFFFFFFFFFFFFFFFF