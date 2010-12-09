private
transform: aByteArray
	self primPluginAvailable ifFalse: [self error: 'DES plugin missing'].
	cookedKey ifNil: [ self error: 'DES key not provided'].
	cookedKey size = 32 ifFalse: [ self error: 'DES cooked key damaged'].
	aByteArray size = 8 ifFalse: [ self error: 'DES block must be 8
bytes'].
	self primTransform: aByteArray using: cookedKey

	