protocol
install

	| prev |
	prev := nil.
	self do: [:this |
		this session: self.
		prev isNil ifFalse: [this up: prev.  prev down: this].
		this install.
		prev := this]