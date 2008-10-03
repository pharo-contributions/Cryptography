accessing
incrementNonce
	"increment my nonce"
	| answer |
	answer := self nonce + 1.
	self nonce: answer.
	^ answer