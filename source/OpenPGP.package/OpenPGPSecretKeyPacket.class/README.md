Data stored in a secret key OpenPGP packet.

Instance Variables:
publicKeyData			<OpenPGPPublicKeyData> public key data for this private key
stringToKeyUsage		<Integer> specifies how the passphrase protecting the secret key is used
stringToKeySpecifier		<OpenPGPS2KSpecifier> further specifying string to key conversion
encryptionAlgorithm	<Integer> specifying the encryption algorithm used to protect the key
initialVector				<ByteArray|nil> initial data for the encryption
mpis					<ByteArray|Array of: LargePositiveInteger> algorithm-specific secret key data
checksum				<Integer> checksum to verify that the user gave the correct passphrase
