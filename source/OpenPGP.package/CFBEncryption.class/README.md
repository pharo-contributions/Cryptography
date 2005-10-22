This class implements cipher feedback encryption in concert with any block cipher.

Instance Variables:
cipher	<BlockCipher> used with the encryption
iv		<ByteArray> initialization vector, is updated for every encrypted byte.
encIV	<ByteArray> encrypted IV, used in the decrpytion step of the CFB
index	<Integer> index into encIV used in the decryption step