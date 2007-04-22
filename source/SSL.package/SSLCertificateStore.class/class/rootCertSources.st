root certs
rootCertSources

	^ OrderedCollection new
		add: self class1cacert;
		add: self class3cacert;
		add: self thawtePremiumServerCA;
		add: self thawteServerCA;
		add: self verisignC1PCAG3v2;
		add: self verisignC2PCAG3v2;
		add: self verisignC3PCAG3v2;
		add: self verisignC4PCAG3v2;
		add: self verisignTSACA;
		add: self verisignSecureServer;
		yourself.
