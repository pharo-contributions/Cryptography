as yet unclassified
ffiCrypt: password with: key  
" on linux you need to install and use the 32bit version of libxcrypt and type its path in the module: field below."
<cdecl: char* 'crypt' (char* char*) module: '/lib32/libxcrypt.so.1'>
^self externalCallFailed