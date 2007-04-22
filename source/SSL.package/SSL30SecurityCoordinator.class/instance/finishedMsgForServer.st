finished msgs
finishedMsgForServer

	| md5Hash shaHash |
	md5Hash := self md5HashFinishedMsgsForServer.
	shaHash := self shaHashFinishedMsgsForServer.
	^ SSL30FinishedMsg new 
		md5Hash: md5Hash;
		shaHash: shaHash;
		yourself.
