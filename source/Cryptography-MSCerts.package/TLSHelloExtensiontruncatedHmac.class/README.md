7.4.1.4.5 Truncated HMAC    http://www.ietf.org/internet-drafts/draft-ietf-tls-rfc4346-bis-01.txt

   Currently defined TLS cipher suites use the MAC construction HMAC
   with either MD5 or SHA-1 [HMAC] to authenticate record layer
   communications.  In TLS the entire output of the hash function is
   used as the MAC tag.  However it may be desirable in constrained
   environments to save bandwidth by truncating the output of the hash
   function to 80 bits when forming MAC tags.

   In order to negotiate the use of 80-bit truncated HMAC, clients MAY
   include an extension of type "truncated_hmac" in the extended client
   hello.  The "extension_data" field of this extension SHALL be empty.

   Servers that receive an extended hello containing a "truncated_hmac"
   extension, MAY agree to use a truncated HMAC by including an
   extension of type "truncated_hmac", with empty "extension_data", in
   the extended server hello.

   Note that if new cipher suites are added that do not use HMAC, and
   the session negotiates one of these cipher suites, this extension
   will have no effect.  It is strongly recommended that any new cipher
   suites using other MACs consider the MAC size as an integral part of
   the cipher suite definition, taking into account both security and
   bandwidth considerations.

   If HMAC truncation has been successfully negotiated during a TLS
   handshake, and the negotiated cipher suite uses HMAC, both the client
   and the server pass this fact to the TLS record layer along with the
   other negotiated security parameters.  Subsequently during the
   session, clients and servers MUST use truncated HMACs, calculated as
   specified in [HMAC].  That is, CipherSpec.hash_size is 10 bytes, and
   only the first 10 bytes of the HMAC output are transmitted and
   checked.  Note that this extension does not affect the calculation of
   the PRF as part of handshaking or key derivation.

   The negotiated HMAC truncation size applies for the duration of the
   session including session resumptions.


