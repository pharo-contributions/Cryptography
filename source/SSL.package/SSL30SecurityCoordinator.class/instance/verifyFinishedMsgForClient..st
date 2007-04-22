finished msgs
verifyFinishedMsgForClient: msg

	| md5Hash shaHash |
	md5Hash := self md5HashFinishedMsgsForClient.
	shaHash := self shaHashFinishedMsgsForClient.
	^ msg md5Hash = md5Hash and: [msg shaHash = shaHash]
