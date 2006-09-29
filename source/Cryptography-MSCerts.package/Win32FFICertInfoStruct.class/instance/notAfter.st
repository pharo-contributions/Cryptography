accessing
notAfter
	"This method was automatically generated"
	^Win32FFIFileTimeStruct fromHandle: (handle pointerAt: 37)