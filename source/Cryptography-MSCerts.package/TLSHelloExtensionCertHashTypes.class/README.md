7.4.1.4.7 Cert Hash Types    http://www.ietf.org/internet-drafts/draft-ietf-tls-rfc4346-bis-01.txt

   The client MAY use the "cert_hash_types" to indicate to the server
   which hash functions may be used in the signature on the server's
   certificate. The "extension_data" field of this extension contains:

         enum{
             md5(0), sha1(1), sha256(2), sha512(3), (255)
         } HashType;

         struct {
               HashType<255> types;
         } CertHashTypes;

   These values indicate support for MD5 [MD5], SHA-1, SHA-256, and
   SHA-512 [SHA] respectively. The server MUST NOT send this extension.

   Clients SHOULD send this extension if they support any algorithm
   other than SHA-1. If this extension is not used, servers SHOULD
   assume that the client supports only SHA-1. Note: this is a change
   from TLS 1.1 where there are no explicit rules but as a practical
   matter one can assume that the peer supports MD5 and SHA-1.

 HashType values are divided into three groups:

      1. Values from 0 (zero) through 63 decimal (0x3F) inclusive are
         reserved for IETF Standards Track protocols.

      2. Values from 64 decimal (0x40) through 223 decimal (0xDF) inclusive
         are reserved for assignment for non-Standards Track methods.

      3. Values from 224 decimal (0xE0) through 255 decimal (0xFF)
         inclusive are reserved for private use.

   Additional information describing the role of IANA in the



Dierks & Rescorla            Standards Track                    [Page 49]draft-ietf-tls-rfc4346-bis-01.txt  TLS                         June 2006


   allocation of HashType code points is described
   in Section 11.


