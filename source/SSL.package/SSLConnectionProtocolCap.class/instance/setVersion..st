accessing
setVersion: aVersion
	"Set the value of version"

	self version: aVersion.
	self initializeSecurityCoordinator.
