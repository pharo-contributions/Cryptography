as yet unclassified
testDES2
	| d plain key |
	plain := 'Squeaker'.
	key := 'Bite me!'.
	d := DES key: key.
	d encryptBlock: plain.
	self assert: plain asByteArray = #(254 141 73 104 43 44 242 206) asByteArray.
	d := DES key: key.
	d decryptBlock: plain.
	self assert: plain = 'Squeaker'