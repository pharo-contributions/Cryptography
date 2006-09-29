services
removeFromCache: aSessionID
	self accessProtect critical: [
		self sessionCache at: aSessionID put: nil.
	].