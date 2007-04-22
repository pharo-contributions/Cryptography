A KeyHolder is a construct that holds key information safely in memory.  The key is never stored in plain text in memory.  The system encrypts the key using two different objects and therefore two different memory locations.  A random key is generated and used to encrypt the key.  That random key is changed every 100ms.  To retrieve the key send the message #key.  You must send in a byteArray.  If you are storing a key that is a string then do:

KeyHolder holdKey: 'aPassword' asByteArray.  

when asking for key you will get back aByteArray so if you are looking for a string use

aByteArray := aKeyHolder key. 
pKey := aByteArray asString.
aByteArray destroy.

When you are done with the byteArray send the message destroy to it, to keep your secret key from being written to disk.  Never leave your key in memory for very log.  Get it, use it and destroy it as quickly as possible in the same message chain.

If you no longer need this keyHolder you must send the message destroy to it to stop the process and wipe the memory clean.

Instance Variables
	data:		KeyHolderData
	random:		aByteArray
	randomChangeProcess:		aProcess 

data
	- holds onto an instance of KeyHolderData which holds your encrypted key.

random
	- the key used to encrypt your key

randomChangeProcess
	- the process that changes random
