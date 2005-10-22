accessing
nextNewFormatPacketLength
	| len |
	len := stream next.
	len > 191 ifTrue: [
		len := len < 224
			ifTrue: [len - 192 * 256 + stream next + 192]
			ifFalse: [
				len = 255
					ifTrue: [stream nextNumber: 4]
					ifFalse: [(1 bitShift: (len \\ 32)) negated]]].
	^len