running
testRivestWithBase
	"Run the simple test given by Ron Rivest in http://theory.lcs.mit.edu/~rivest/destest.txt"

	| des x |
	des := DES new.
	x := 16r9474B8E8C73BCA7D asByteArray.
	1 to: 16 do: [:i |
		des key: x copy.
		i odd
			ifTrue: [des encryptBlock: x]
			ifFalse: [des decryptBlock: x]].
	self assert: x = 16r1B1A2DDB4C642438 asByteArray