private-buffers
storeLength: bitLength in: aByteArray
	"Fill in the final 8 bytes of the given ByteArray with a 64-bit
	little-endian representation of the original message length in bits."

	| n i |
	n _ bitLength.
	i _ aByteArray size - 8 + 1.
	[n > 0] whileTrue: [
		aByteArray at: i put: (n bitAnd: 16rFF).
		n _ n bitShift: -8.
		i _ i + 1].
