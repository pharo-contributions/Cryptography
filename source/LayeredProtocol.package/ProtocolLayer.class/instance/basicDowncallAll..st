stack
basicDowncallAll: chunk

	down notNil ifTrue: [down downcallAll: chunk].
