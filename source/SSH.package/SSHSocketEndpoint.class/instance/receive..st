process
receive: msg

	| data |
	data := msg data asByteArray.
	self upcallAll: data.
