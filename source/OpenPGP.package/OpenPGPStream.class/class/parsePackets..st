instance creation
parsePackets: aStream
	^[(self onStream: aStream) nextPacketsUpToEnd] ensure: [aStream close]