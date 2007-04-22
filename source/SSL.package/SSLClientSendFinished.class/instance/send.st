process
send

	| finishedMsg |
	finishedMsg := self securityCoord finishedMsgForClient.
	self sendHandshake: finishedMsg.
