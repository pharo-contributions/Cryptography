as yet unclassified
testBcryptFfi
	self assert:(( BCryptLinuxFFI  bcrypt: 'U*U' with:'C'  for: 5) = '$2a$05$CCCCCCCCCCCCCCCCCCCCC.E5YPO9kmyuRGyh0XouQYb4YMJKvyOeW')