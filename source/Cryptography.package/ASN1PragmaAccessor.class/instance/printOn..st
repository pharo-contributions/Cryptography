printing
printOn: aWS
	aWS nextPutAll: self asn1name asString, String tab, self systemClass asString, '>>', self method asString.