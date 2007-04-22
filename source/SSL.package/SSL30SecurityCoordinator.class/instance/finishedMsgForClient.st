finished msgs
finishedMsgForClient

	| md5Hash shaHash |
	md5Hash := self md5HashFinishedMsgsForClient.
	shaHash := self shaHashFinishedMsgsForClient.
	^ SSL30FinishedMsg new 
		md5Hash: md5Hash;
		shaHash: shaHash;
		yourself.
