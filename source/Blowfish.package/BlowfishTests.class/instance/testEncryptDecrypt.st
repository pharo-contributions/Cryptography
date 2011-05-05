as yet unclassified
testEncryptDecrypt

self assert:((Blowfish decryptToString:    (Blowfish encryptString: '0123456789' with: 'AAAAA'  )  with:'AAAAA'  )='0123456789')