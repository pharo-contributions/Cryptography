accessing
keyID
	^(self version <= 3
		ifTrue: [self mpis first]
		ifFalse: [self fingerprint]) bitAnd: 16rFFFFFFFF