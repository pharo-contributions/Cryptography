protocol
receive: msg

	[msg processOnConnection: self]
		on: Error
		do: [:ex |
			Transcript show: '{SSLConnectionProtocolCap>>receive: - ' , ex messageText , '}'.
			self halt.
			SSLSendError signal
		].
