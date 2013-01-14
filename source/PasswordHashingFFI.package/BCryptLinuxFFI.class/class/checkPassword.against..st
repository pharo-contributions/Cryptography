as yet unclassified
checkPassword: password against: hash
	| salt hashedPassword result |
	"might be constant time now.  to mitigate timing attacks"
	salt := hash copyFrom: 1 to: 29.
	hashedPassword := self ffiCrypt: password with: salt.
	hash size = hashedPassword size
		ifFalse: [ ^ false ].
	result := true.
	1 to: hash size do: [ :index | result := result and: [ (hash at: index) = (hashedPassword at: index )] ].
	^ result