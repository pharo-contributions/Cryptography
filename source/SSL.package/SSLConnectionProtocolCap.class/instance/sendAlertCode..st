protocol
sendAlertCode: alertCode

	| alert |
	alert := SSLAlert newOnCode: alertCode.
	self sendAlert: alert.
