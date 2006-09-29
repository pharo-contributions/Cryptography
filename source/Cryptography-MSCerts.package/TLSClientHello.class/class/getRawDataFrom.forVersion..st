constants
getRawDataFrom: aStream forVersion: helloVersion
	"return to the sender the raw data from the stream based on the version"
	helloVersion = self ssl20constant ifTrue: [
		 ^aStream nextInBuffer: (aStream next asInteger)
	].
	helloVersion = self ssl30constant ifTrue: [
		^aStream nextAllInBuffer
	].