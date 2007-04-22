finished msgs
finishedMsgForClient

	| hash |
	hash := self hashFinishedMsgsForClient.
	^ SSLFinishedMsg new 
		verifyData: hash;
		yourself.
