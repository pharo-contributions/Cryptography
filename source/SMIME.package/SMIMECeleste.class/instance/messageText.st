message text pane
messageText
	"Answer the text which makes up the complete message (header+body)"

	| msg |
	mailDB ifNil: [ ^self messageTextIfNoDB ].
	(currentMsgID isNil) ifTrue: [^''].

	msg := self smimeAgent processMsg: self currentMessage.

	SuppressWorthlessHeaderFields
		ifTrue: [^ self currentMessageSecurityHeaderText, String cr, String cr,  self currentMessage cleanedHeader asText, String cr , msg bodyTextFormatted]
		ifFalse: [^ self currentMessageSecurityHeaderText, String cr, String cr, msg text isoToSqueak].
