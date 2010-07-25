as yet unclassified
testDES2
	| plain key d |
	plain := 'squeaker' asByteArray.
	key := 'hacking!' asByteArray.
	d := DES key: key.
	d encryptBlock: plain.
	self assert: plain = #[64 222 70 13 59 145 76 186]