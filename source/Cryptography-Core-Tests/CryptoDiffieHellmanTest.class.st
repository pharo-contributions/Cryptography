Class {
	#name : #CryptoDiffieHellmanTest,
	#superclass : #TestCase,
	#category : #'Cryptography-Core-Tests-Diffie-Hellman'
}

{ #category : #'accessing - data' }
CryptoDiffieHellmanTest >> generator [

	^ 19717436579274206947345122013064021491006648667525860934655329476450089156965164852462918009904002231332897658527803
]

{ #category : #'accessing - data' }
CryptoDiffieHellmanTest >> prime [

	^ 75736283208334870880874184828066736731062763491072315486250947429607562308928878772529680132938244784039544211105987
]

{ #category : #tests }
CryptoDiffieHellmanTest >> testDiffieHellman [

	| alice bob fromAlice fromBob k1 k2 |
	alice := DiffieHellman prime: self prime generator: self generator.
	bob := DiffieHellman prime: self prime generator: self generator.
	fromAlice := alice sendMessage.
	fromBob := bob sendMessage.
	k1 := alice receiveMessage: fromBob.
	k2 := bob receiveMessage: fromAlice.
	self assert: k1 equals: k2
]

{ #category : #tests }
CryptoDiffieHellmanTest >> testDiffieHellmanWithGeneration [

	| alice bob fromAlice fromBob k1 k2 |
	alice := DiffieHellman bits: 64. "very low for speed"
	bob := DiffieHellman prime: alice prime generator: alice generator.
	fromAlice := alice sendMessage.
	fromBob := bob sendMessage.
	k1 := alice receiveMessage: fromBob.
	k2 := bob receiveMessage: fromAlice.
	self assert: k1 equals: k2
]
