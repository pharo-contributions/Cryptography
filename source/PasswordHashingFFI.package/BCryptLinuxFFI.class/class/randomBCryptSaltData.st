as yet unclassified
randomBCryptSaltData
	 
	|  combined targetStream char random |
     combined:='0123456789ABCDEFGHIJKLMNOPQRSTUVWXZYabcdefghijklmnopqrstuvwxyz'.
	targetStream := WriteStream on: (String new: self saltDataLength ).
	random := Random new.
	[targetStream contents size <= self saltDataLength] whileTrue: 
			[char :=combined 
						at: (random next * (combined size - 1)) rounded + 1.
			char isAlphaNumeric ifTrue: [targetStream nextPut: char]].
	^targetStream contents  