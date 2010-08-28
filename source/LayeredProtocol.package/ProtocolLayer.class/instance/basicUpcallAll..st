stack
basicUpcallAll: chunk

	(up notNil and: [chunk notNil]) ifTrue: [up upcallAll: chunk].
