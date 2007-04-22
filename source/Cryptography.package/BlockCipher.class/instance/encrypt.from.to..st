accessing
encrypt: aByteArray from: startPos to: endPos 
	"Encrypt aByteArray in place."
	self 
		blocksIn: aByteArray
		from: startPos
		to: endPos
		do: [:each | self encryptBlock: each].
	^aByteArray