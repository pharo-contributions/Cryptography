private
switchToClosed

	self state: SSLConnectionClosed new.
	self protocolCap: nil.
	[self triggerEvent: #closed]
		on: Error
		do: [:ex | Transcript show: '{SSLSocket>>switchToClosed - ' , ex messageText , '}'].