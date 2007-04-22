class initialization
initialize
	"SafeSocket initialize"

	InstanceList _ IdentitySet new.
	Smalltalk
		addToStartUpList: self;
		addToShutDownList: self.