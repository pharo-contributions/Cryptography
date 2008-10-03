initialize-release
initializeProcessAtPriority: pNumber
	process := [ self pvtListenLoop ] newProcess. 
	process priority: pNumber