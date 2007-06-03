message text pane
messageText
	"Answer the text which makes up the complete message (header+body)"

	| msg |
	mailDB ifNil: [ ^self messageTextIfNoDB ].
	(currentMsgID isNil) ifTrue: [^''].

	"msg := self smimeAgent processMsg: self currentMessage."
	msg := self currentMessage.

	SuppressWorthlessHeaderFields
		ifTrue: [^ self currentMessageSecurityHeaderText, String cr, String cr, msg formattedText]
		ifFalse: [^ self currentMessageSecurityHeaderText, String cr, String cr, msg text isoToSqueak].
