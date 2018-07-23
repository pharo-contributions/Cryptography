accessing
privateKeys
	"Answer the value of privateKeys"

	privateKeys isNil ifTrue: [self privateKeys: OrderedCollection new].
	^ privateKeys