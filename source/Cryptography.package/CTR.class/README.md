This CTR mode implementation was guided by

	Nils Ferguson, Bruce Schneier.  Pratical Cryptography.  
	Wiley, 2003.
	pp. 75-82, 111-127.

With CTR, my initialVector is partitioned into a nonce and a counter ("i" in the book).  My blockSize, 128-bits, are available to accommodate both of these "fields".  The two of them combined together form my #initialVector (IV).  The book suggests the nonce portion used as a message-number used also in sequencing messages of a secure-channel (chapter 8).  The overall requirement is that the same initialVector (i.e., counter+nonce combination) never be used twice for this key (instance).  The counter is re-set to 1 each time the nonce is set.

If you run out of counter, I signal a CryptographyError.