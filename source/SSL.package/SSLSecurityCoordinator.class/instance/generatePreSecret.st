secret
generatePreSecret
 
	^ self securityParams originalVersion asByteArray, (SecureRandom new nextBits: 368) asByteArray.
