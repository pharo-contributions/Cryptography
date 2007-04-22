finished msgs
verifyFinishedMsgForServer: msg

	| md5Hash shaHash |
	md5Hash := self md5HashFinishedMsgsForServer.
	shaHash := self shaHashFinishedMsgsForServer.
	^ msg md5Hash = md5Hash and: [msg shaHash = shaHash]
