as yet unclassified
generateRandomSalt

	^'$2a$' , self defaultRounds greaseString , '$' , self randomBCryptSaltData.