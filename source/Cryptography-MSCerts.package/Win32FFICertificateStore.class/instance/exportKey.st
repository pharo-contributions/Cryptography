primitives
exportKey

	"// exported key blob definitions
	#define SIMPLEBLOB              0x1
	#define PUBLICKEYBLOB           0x6
	#define PRIVATEKEYBLOB          0x7
	#define PLAINTEXTKEYBLOB        0x8
	#define OPAQUEKEYBLOB           0x9
	#define PUBLICKEYBLOBEX         0xA
	#define SYMMETRICWRAPKEYBLOB    0xB
	#define KEYSTATEBLOB            0xC"

	| buffer bufferSize |
	self getHKey.
	bufferSize := self exportKeySize.
	buffer := ExternalAddress allocate: (bufferSize unsignedLongAt: 1).
	self class cryptExportKey: self hKey exportKeyHandle: 0 blobType: 7 flags: 0 blobData: buffer asInteger blobLength: bufferSize asInteger.
	self exportedKeySize: (bufferSize unsignedLongAt: 1).
	bufferSize free.
	self exportedKey: buffer