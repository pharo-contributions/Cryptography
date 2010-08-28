protocol
run
	"Spawn a background process running the serverLoop."

	super run.
	serverProcess := [self serverLoop] forkAt: Processor userBackgroundPriority.