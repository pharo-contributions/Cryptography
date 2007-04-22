finished msgs
finishedMsgForServer

	| hash |
	hash := self hashFinishedMsgsForServer.
	^ SSLFinishedMsg new 
		verifyData: hash;
		yourself.
