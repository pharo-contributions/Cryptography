instance creation
holdKey: aKey
	"store a key scrambled in memory"
	^self new
		data: (KeyHolderData new);
		encryptKey: aKey;
		randomChangeLoop;
		yourself