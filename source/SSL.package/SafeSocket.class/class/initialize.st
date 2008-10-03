class initialization
initialize
	"SafeSocket initialize"

	InstanceList := IdentitySet new.
	Smalltalk
		addToStartUpList: self;
		addToShutDownList: self.