protocol
receive: msg

	[msg processOnConnection: self]
		on: Error
		do: [:ex | self halt. SSLSendError signal].
