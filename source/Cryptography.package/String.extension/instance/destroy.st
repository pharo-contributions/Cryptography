*cryptography
destroy
	1 
		to: self size
		do: 
			[ : n | 
			self 
				at: n
				put: (Character value: 0) ]