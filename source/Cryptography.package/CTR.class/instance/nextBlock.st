private
nextBlock
	| kSubI |
	self incrementCounter.
	kSubI _ vector copy.  "as named in the book"
	cipher encryptBlock: kSubI.
	^ kSubI