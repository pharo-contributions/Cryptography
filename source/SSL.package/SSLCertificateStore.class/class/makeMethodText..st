root certs
makeMethodText: aFile

	| aMethodName aFileName |
	((aFile size >= 19) 
		and: [(aFile copyFrom:1 to:  19) = 'BuiltinObjectToken-'] ) "Firefox exports too much material in the file name so we chop off a bit. "
		ifTrue:
			[aFileName := aFile copyFrom: 20 to: (aFile size - 4).]
		ifFalse: 
			[aFileName := aFile copyFrom: 1 to: (aFile size - 4).].
	
	"Turn a file name into a method name with asLegalSelector. Putting 'add' in front  lets us keep the proper noun capitalized. We put them all in their own method category to simplify automated loading and running. No other methods should be in this category."

	aMethodName := ('add', aFileName) asLegalSelector,
			Character cr, Character cr, Character tab, '^', $'.
	^ aMethodName.