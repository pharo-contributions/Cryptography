field definition
fields
	"Win32FFICryptBitBlobStruct defineFields
//+-------------------------------------------------------------------------
//  In a CRYPT_BIT_BLOB the last byte may contain 0-7 unused bits. Therefore, the
//  overall bit length is cbData * 8 - cUnusedBits.
//--------------------------------------------------------------------------
typedef struct _CRYPT_BIT_BLOB {
    DWORD   cbData;
    BYTE    *pbData;
    DWORD   cUnusedBits;
} CRYPT_BIT_BLOB, *PCRYPT_BIT_BLOB;
	"
	^#(
		(cbData	'ulong')
		(pbData 'byte *')
		(cUnusedBits	'ulong')
	   )