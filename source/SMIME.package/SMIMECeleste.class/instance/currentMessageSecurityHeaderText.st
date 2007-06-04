message text pane
currentMessageSecurityHeaderText

	| message isSigned msg verifiedSig isEncrypted goodDecryption |
	currentMsgID isNil ifTrue: [^ ''].
	message := self currentMessage.
	isEncrypted := self smimeAgent isEncryptedMsg: message.
	(isEncrypted and: [self smimeAgent canDecrypt])
		ifTrue: [
			msg := self smimeAgent processEncrypted: message.
			goodDecryption := msg isKindOf: MailMessage.
			goodDecryption ifTrue: [message := msg]]
		ifFalse: [goodDecryption := false].
	isSigned := self smimeAgent isSignedMsg: message.
	isSigned ifTrue: [
		msg := self smimeAgent processSigned: message.
		verifiedSig := msg isKindOf: MailMessage.
		verifiedSig ifTrue: [message := msg]].
	^ String streamContents: [:str |
		isSigned ifTrue: [
			verifiedSig
				ifTrue: [str nextPutAll: 'good signature']
				ifFalse: [str nextPutAll: 'unverified signature'].
			str nextPutAll: '    '].
		isEncrypted ifTrue: [
			goodDecryption
				ifTrue: [str nextPutAll: 'good encryption']
				ifFalse: [str nextPutAll: 'failed encryption']]].
