private
nextBlock
	| kSubI |
	self incrementCounter.
	kSubI := vector copy.  "as named in the book"
	cipher encryptBlock: kSubI.
	^ kSubI