field definition
fields
	" Win32FFIFileTimeStruct defineFields
typedef struct _FILETIME {
    DWORD dwLowDateTime;
    DWORD dwHighDateTime;
} FILETIME, *PFILETIME, *LPFILETIME; 
"
	^#(
		(dwLowDateTime		'ulong')
		(dwHighDateTime	'ulong')
	   )