as yet unclassified
processServerFinishedMsg: msg

	(self securityCoord verifyFinishedMsgForServer: msg)
		ifFalse: [^ self sendAlertCode: 40].
