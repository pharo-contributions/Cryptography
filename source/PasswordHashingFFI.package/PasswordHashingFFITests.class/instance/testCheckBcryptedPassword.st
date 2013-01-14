as yet unclassified
testCheckBcryptedPassword
|hashed pwd|

self assert:(BCryptLinuxFFI checkPassword:  'U*U' against:'$2a$05$CCCCCCCCCCCCCCCCCCCCC.E5YPO9kmyuRGyh0XouQYb4YMJKvyOeW' )