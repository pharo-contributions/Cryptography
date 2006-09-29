instance creation
handShake: aHandShake certificate: aCertificate
	^self new
		handShake: aHandShake;
		certificate: aCertificate;
		createRawData;
		yourself