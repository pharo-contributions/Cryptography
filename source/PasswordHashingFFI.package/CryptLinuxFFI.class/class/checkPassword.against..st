as yet unclassified
checkPassword: password against: hashedPassword
	| salt newHash result |
	"might be constant time now.  to mitigate timing attacks"
	salt := (hashedPassword at: 1) = $$
		ifTrue: [ hashedPassword copyFrom: 1 to: 12 ]
		ifFalse: [ hashedPassword copyFrom: 1 to: 2 ].
	newHash := self ffiCrypt: password with: salt.
	newHash size = hashedPassword size
		ifFalse: [ ^ false ].
	result := true.
	1 to: hashedPassword size do: [ :index | result := result and: [ (newHash at: index) = (hashedPassword at: index) ] ].
	^ result