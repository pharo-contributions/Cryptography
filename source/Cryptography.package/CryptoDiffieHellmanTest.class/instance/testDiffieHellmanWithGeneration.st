testing
testDiffieHellmanWithGeneration

	| alice bob fromAlice fromBob k1 k2 |
	alice _ DiffieHellman bits: 64.  "very low for speed"
	bob _ DiffieHellman prime: alice prime generator: alice generator.
	fromAlice _ alice sendMessage.
	fromBob _ bob sendMessage.
	k1 _ alice receiveMessage: fromBob.
	k2 _ bob receiveMessage: fromAlice.
	self assert: k1 = k2