finished msgs
verifyFinishedMsgForServer: msg

	| hash |
	hash := self hashFinishedMsgsForServer.
	^ msg verifyData = hash
