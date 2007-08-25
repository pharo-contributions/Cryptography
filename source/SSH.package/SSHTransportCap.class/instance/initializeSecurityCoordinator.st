initialize-release
initializeSecurityCoordinator

	self securityCoordinator: (SSHSecurityCoordinator newOnConnection: self).
