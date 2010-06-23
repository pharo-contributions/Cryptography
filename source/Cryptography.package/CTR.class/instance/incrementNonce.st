accessing
incrementNonce
	"increment my nonce"
	| answer |
	answer _ self nonce + 1.
	self nonce: answer.
	^ answer