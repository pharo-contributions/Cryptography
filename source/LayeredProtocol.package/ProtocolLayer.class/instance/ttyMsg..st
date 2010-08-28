diagnostics
ttyMsg: aString

	aString withInternetLineEndings asByteArray do: [:b | up upcall: b].
	up flush