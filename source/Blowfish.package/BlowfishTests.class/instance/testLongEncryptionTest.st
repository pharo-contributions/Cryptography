as yet unclassified
testLongEncryptionTest

(1 to: keys size) do:[:each | |key clearText cipherText enc| 
	key:= keys at: each.
	clearText:=clear at: each.
	cipherText:=encrypted at: each.
	enc:=Blowfish encrypt: clearText  with: key.   
	self assert:   (enc = cipherText )
	]