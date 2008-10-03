initialization-release
counterBits: anInteger
	((16 to: 128 by: 16) includes: anInteger) ifFalse:
		[ CryptographyError signal: 'invalid counter size' ].
	counterBits := anInteger.
	maximumCounterValue := (1 bitShift: counterBits) - 1