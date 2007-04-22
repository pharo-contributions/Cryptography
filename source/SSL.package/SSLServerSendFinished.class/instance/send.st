process
send

	| finishedMsg |
	finishedMsg := self securityCoord finishedMsgForServer.
	self sendHandshake: finishedMsg.
