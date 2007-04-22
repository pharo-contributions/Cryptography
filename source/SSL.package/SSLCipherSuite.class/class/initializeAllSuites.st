initialize-release
initializeAllSuites

	self subclasses do: [:e | self allSuites add: e new].
