testing
testDiffieHellman

	| alice bob fromAlice fromBob k1 k2 |
	alice _ DiffieHellman prime: self prime generator: self generator.
	bob _ DiffieHellman prime: self prime generator: self generator.
	fromAlice _ alice sendMessage.
	fromBob _ bob sendMessage.
	k1 _ alice receiveMessage: fromBob.
	k2 _ bob receiveMessage: fromAlice.
	self assert: k1 = k2