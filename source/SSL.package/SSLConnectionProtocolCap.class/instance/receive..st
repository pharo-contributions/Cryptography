protocol
receive: msg
	
	| msgText |
	[msg processOnConnection: self]
		on: Error
		do: [:ex |
			msgText :=  '{SSLConnectionProtocolCap>>receive: - ' , ex messageText , '}'.
			Transcript show:  msgText.
			self halt.
			SSLSendError signal:  msgText
		].
