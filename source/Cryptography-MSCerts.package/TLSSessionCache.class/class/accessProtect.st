classVariables
accessProtect
	"return the semaphore for mutual exclusion"
	^AccessProtect ifNil: [AccessProtect _ Semaphore forMutualExclusion. AccessProtect].