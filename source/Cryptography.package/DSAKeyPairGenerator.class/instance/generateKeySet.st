as yet unclassified
generateKeySet
	"Generate and answer a key set for DSA. The result is a pair (<private key><public key>). Each key is an array of four large integers. The private key is (p, q, g, x); the public one is (p, q, g, y). The signer must be sure to record (p, q, g, x), and must keep x secret to prevent someone from forging their signature."
	"Note: Key generation can take some time. Open a transcript so you can see what's happening and take a coffee break!"

	| exp h |
	random _ SecureRandom new.
	self generateQandP.
	exp _ (p - 1) / q.
	h _ 2.
	[g _ h raisedTo: exp modulo: p. g = 1] whileTrue: [h _ h + 1].
	x _ self nextRandom160.
	y _ g raisedTo: x modulo: p.
