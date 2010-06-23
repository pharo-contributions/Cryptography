private
counter: anInteger 
	vector 
		uint: counterBits
		at: self positionOfCounter
		put: anInteger.
	counter := anInteger