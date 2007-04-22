This class implements the Data Encryption Standard (DES) block cipher per
ANSI X3.92.  It requires the presence of the 'DESPlugin'.  At some future
date the functionality of the plugin may be provided in pure Smalltalk, but
the slowness would be prohibitive for anything other than trivial usage.
The main barrier to translation is the heavy use of zero-based indexing of
arrays.

How to use: you first provide an 8-byte key which will be used to encode
and decode the data. Internally, this is 'cooked' into a 32-word format to
speed up the encryption process.  The data is then sent in 8-byte packets
to be encoded or decoded.  You must externally account for padding.  See
the 'testing' category on the class side for examples.

As of this date (1/26/2000), the U.S. Government has lifted many of the
previous restrictions on the export of encryption software, but you should
check before exporting anything including this code.

Submitted by Duane Maxwell.

