accessing
image
	"Must use RWBinaryOrTextStream because the XBM reader wants to switch the stream to ascii :-("
	^ImageReadWriter formFromStream: (RWBinaryOrTextStream with: (data copyFrom: 23 to: data size))