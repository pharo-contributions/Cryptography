accessing
pCertInfo
	"This method was automatically generated"
	^Win32FFICertInfoStruct fromHandle: (handle pointerAt: 13)