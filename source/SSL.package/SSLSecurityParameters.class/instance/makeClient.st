process
makeClient
 
	self connectionEnd: #client.
	self serverRandom: nil.
	self clientRandom: ((SecureRandom new nextBits: 256) asByteArrayOfSize: 32).
