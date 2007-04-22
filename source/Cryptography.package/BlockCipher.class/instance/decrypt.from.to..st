accessing
decrypt: aByteArray from: startPos to: endPos 
	"Decrypt aByteArray in-place."
	self 
		blocksIn: aByteArray
		from: startPos
		to: endPos
		do: [:each | self decryptBlock: each].
	^ aByteArray