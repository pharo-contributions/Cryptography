as yet unclassified
testDES3
	| plain key d |
	plain := 'squeaker'.
	key := 'hacking!'.
	Transcript cr; show: 'plain: ', plain printString.
	d := DES key: key.
	d encryptBlock: plain.
	Transcript cr; show: 'plain: ', plain printString.
	self assert: plain asByteArray = #[64 222 70 13 59 145 76 186].
