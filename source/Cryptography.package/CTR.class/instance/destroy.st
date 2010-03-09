initialization-release
destroy
	super destroy.
	counter := 0 "avoid potential leakage"