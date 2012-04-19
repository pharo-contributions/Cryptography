as yet unclassified
longDecryptionTest
	(1 to: keys size)
		do: [ :each | 
			| key clearText cipherText enc |
			key := keys at: each.
			clearText := clear at: each.
			cipherText := encrypted at: each.
			enc := Blowfish decrypt: cipherText with: key ]