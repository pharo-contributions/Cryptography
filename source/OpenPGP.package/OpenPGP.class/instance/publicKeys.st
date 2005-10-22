private
publicKeys
	publicKeys == nil ifTrue: [publicKeys := self readKeyring: DefaultPublicKeyFile].
	^publicKeys