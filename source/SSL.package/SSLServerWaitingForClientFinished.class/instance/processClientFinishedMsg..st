process
processClientFinishedMsg: msg

	(self securityCoord verifyFinishedMsgForClient: msg)
		ifFalse: [^ self sendAlertCode: 40].
	self sendMessages.
