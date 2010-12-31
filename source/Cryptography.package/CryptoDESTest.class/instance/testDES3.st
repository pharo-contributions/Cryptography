as yet unclassified
testDES3
	| plain plainCopy key d |
	plain := 'squeaker'.
	key := 'hacking!'.
	plainCopy := plain copy.
	d := DES key: key.
	d encryptBlock: plainCopy.
	self assert: plainCopy asByteArray = #[64 222 70 13 59 145 76 186].
