*cryptography
initRandomNonInteractively
	"[self initRandom: (SoundService default randomBitsFromSoundInput: 512)]
		ifError: [self initRandomFromString: 
			Time millisecondClockValue printString, 
			Date today printString, 
			SmalltalkImage current platformName printString]."

	self initRandom: (SecureRandom new nextBytesNonZero: 64) asInteger.
