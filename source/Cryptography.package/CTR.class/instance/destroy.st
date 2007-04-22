initialization-release
destroy
	super destroy.
	counter _ 0 "avoid potential leakage"