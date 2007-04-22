api
processMsg: mailMsg

	| newMailMsg |
	mailMsg body contentType = 'application/pkcs7-mime'
		ifTrue: [
			newMailMsg := self processEncrypted: mailMsg.
			^ self processMsg: newMailMsg].
	mailMsg body contentType = 'multipart/signed'
		ifTrue: [
			newMailMsg := self processSigned: mailMsg.
			^ newMailMsg].
	^ mailMsg
