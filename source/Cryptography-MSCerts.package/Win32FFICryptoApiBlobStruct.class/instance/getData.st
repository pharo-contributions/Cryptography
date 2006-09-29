accessing
getData
	^((self cbData to: 1 by: -1) collect: [:i | self pbData getHandle byteAt: i]) asByteArray