instance creation
openStore: storeParameters
	"pass storeParameters needed to open the certificate store"
	| aStoreProvider aType aNull aLocOrFlag aLocation |
	aStoreProvider := storeParameters first.
	aType := storeParameters second.
	aNull := storeParameters third.
	aLocOrFlag := storeParameters fourth.
	aLocation := storeParameters fifth.
	^self new 
		hStore:(
		self certOpenStore: aStoreProvider encodingType: aType null: aNull locationOrFlag: aLocOrFlag preDefinedSystemStore: aLocation);
		yourself.