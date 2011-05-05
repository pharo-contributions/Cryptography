as yet unclassified
randomSalt: aSize
	| numbers bigAlphas littleAlphas combined targetStream char random |
	numbers := (46 to: 57) collect: [:each | each asCharacter].
	bigAlphas := (65 to: 90) collect: [:each | each asCharacter].
	littleAlphas := (97 to: 122) collect: [:each | each asCharacter].
	combined:= numbers, bigAlphas, littleAlphas.
	targetStream := WriteStream on: (String new: aSize ).
	random := Random new.
	[targetStream contents size <= aSize] whileTrue: 
			[char :=combined 
						at: (random next * (combined size - 1)) rounded + 1.
			char isAlphaNumeric ifTrue: [targetStream nextPut: char]].
	^targetStream contents  