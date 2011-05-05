as yet unclassified
prepareSalt: aSalt
"the crypt(3) function only uses the first 8 characters of the salt.  "
| newSalt saltSize |
	saltSize := 8.
	aSalt == nil
		ifTrue: [ newSalt := self randomSalt: saltSize ]
		ifFalse: [ 
			aSalt size < saltSize
				ifTrue: [ 
					newSalt := String new: saltSize.
					(1 to: saltSize) do: [ :each | newSalt at: each put: (aSalt atWrap: each) ] ]
				ifFalse: [ newSalt := aSalt copyFrom: 1 to: saltSize ] ].
	^ newSalt