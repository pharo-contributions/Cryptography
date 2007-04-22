process
v15SignMessage: aMessage

	^ self v15SignMessageHash: (SHA1 hashMessage: aMessage).
