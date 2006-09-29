services
openCertSelect
	"pCertContext = CryptUIDlgSelectCertificateFromStore(
hCertStore,
NULL,
NULL,
NULL,
CRYPTUI_SELECT_LOCATION_COLUMN,
0,
NULL))"
	^self selectedCertificate: (self cryptUIDlgSelectCertificateFromStore: self hStore winHandle: nil pwszTitle: nil pwszDisplayString: nil dwDontUseColumn: 10 flags: 0 reserved: nil)