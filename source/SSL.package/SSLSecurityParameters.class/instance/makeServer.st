process
makeServer
 
	self connectionEnd: #server.
	self clientRandom: nil.
	self serverRandom: ((SecureRandom new nextBits: 256) asByteArrayOfSize: 32).
