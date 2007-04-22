private
incrementCounter
	counter >= maximumCounterValue 
		ifTrue:
			[ CryptographyError signal: 'cannot operate on more than ', maximumCounterValue printString, ' blocks at a time.' ].
	self counter: counter + 1