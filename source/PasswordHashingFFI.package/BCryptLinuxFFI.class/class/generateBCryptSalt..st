as yet unclassified
generateBCryptSalt: aSalt
	| newSalt saltSize |
	saltSize := 22.
	aSalt == nil
		ifTrue: [ newSalt := self randomBCryptSalt: saltSize ]
		ifFalse: [ 
			aSalt size < saltSize
				ifTrue: [ 
					newSalt := String new: saltSize.
					(1 to: saltSize) do: [ :each | newSalt at: each put: (aSalt atWrap: each) ] ]
				ifFalse: [ newSalt := aSalt copyFrom: 1 to: saltSize ] ].
	^ newSalt