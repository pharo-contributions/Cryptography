initialization-release
counterBits: anInteger
	((16 to: 128 by: 16) includes: anInteger) ifFalse:
		[ CryptographyError signal: 'invalid counter size' ].
	counterBits _ anInteger.
	maximumCounterValue _ (1 bitShift: counterBits) - 1