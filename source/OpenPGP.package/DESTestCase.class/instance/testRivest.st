running
testRivest
	"Run the simple test given by Ron Rivest in http://theory.lcs.mit.edu/~rivest/destest.txt"

	| des x |
	des := DESForOpenPGP new.
	x := 16r9474B8E8C73BCA7D.
	1 to: 16 do: [:i |
		des setKey: x.
		x := i odd
			ifTrue: [des encryptBlock: x]
			ifFalse: [des decryptBlock: x]].
	self assert: x = 16r1B1A2DDB4C642438