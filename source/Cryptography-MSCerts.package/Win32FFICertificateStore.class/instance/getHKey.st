primitives
getHKey
	"#define AT_KEYEXCHANGE          1
      #define AT_SIGNATURE             2"

	| aBuffer |
	self getCryptProvider.
	aBuffer := ExternalAddress allocate: 4.
	aBuffer unsignedLongAt: 1 put: 0.
	self class cryptGetUserKey: self cryptProvider keyType: 1 handleBuffer: aBuffer asInteger.
	self hKey: (aBuffer unsignedLongAt: 1).
	aBuffer free. 