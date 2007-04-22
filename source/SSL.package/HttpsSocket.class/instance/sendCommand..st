api
sendCommand: cmd

	self conn send: cmd, String crlf.