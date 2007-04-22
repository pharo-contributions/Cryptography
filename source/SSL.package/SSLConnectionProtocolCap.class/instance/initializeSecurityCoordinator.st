initialize-release
initializeSecurityCoordinator

	self securityCoordinator: ((self securityCoordinatorClassDict 
		at: self version 
		ifAbsent: [^ nil]) 
			newOnProtocolCap: self).