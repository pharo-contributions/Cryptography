accessing
setInitialVersion: aVersion
	"Set the value of version"

	self securityParams originalVersion: aVersion.
	self version: aVersion.
	self initializeSecurityCoordinator.
