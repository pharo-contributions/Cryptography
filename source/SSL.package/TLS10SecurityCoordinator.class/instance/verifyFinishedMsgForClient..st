finished msgs
verifyFinishedMsgForClient: msg

	| hash |
	hash := self hashFinishedMsgsForClient.
	^ msg verifyData = hash
