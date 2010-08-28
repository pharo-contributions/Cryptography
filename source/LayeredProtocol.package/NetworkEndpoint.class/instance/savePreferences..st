private
savePreferences: dict

	dict at: #endpointClass put: self class name.
	dict at: #endpointCreate put: #newConnection:port:.
	dict at: #endpointArguments put: (Array with: socket name with: socket remotePort)