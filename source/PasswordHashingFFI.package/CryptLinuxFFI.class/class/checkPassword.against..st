as yet unclassified
checkPassword: password against: hashedPassword
	| salt newHash |
	salt := (hashedPassword at: 1) = $$
		ifTrue: [ hashedPassword copyFrom: 1 to: 12 ]
		ifFalse: [ hashedPassword copyFrom: 1 to: 2 ].
		
	newHash := self ffiCrypt: password  with:   salt.
	^newHash = hashedPassword 