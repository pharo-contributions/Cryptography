others
testEncryptDecrypt
	BlockCipherMode allSubclasses asArray do:
		[ : each |
		[ self runEncryptDecrypt: each ]
			on: Warning
			do: [ : warn | warn resume ] ]