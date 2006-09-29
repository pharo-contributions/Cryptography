7.4.1.4.4 Trusted CA Indication  http://www.ietf.org/internet-drafts/draft-ietf-tls-rfc4346-bis-01.txt

   Constrained clients that, due to memory limitations, possess only a
   small number of CA root keys, may wish to indicate to servers which
   root keys they possess, in order to avoid repeated handshake
   failures.

   In order to indicate which CA root keys they possess, clients MAY
   include an extension of type "trusted_ca_keys" in the (extended)
   client hello.  The "extension_data" field of this extension SHALL
   contain "TrustedAuthorities" where:

         struct {
             TrustedAuthority trusted_authorities_list<0..2^16-1>;



Dierks & Rescorla            Standards Track                    [Page 45]draft-ietf-tls-rfc4346-bis-01.txt  TLS                         June 2006


         } TrustedAuthorities;

         struct {
             IdentifierType identifier_type;
             select (identifier_type) {
                 case pre_agreed: struct {};
                 case key_sha1_hash: SHA1Hash;
                 case x509_name: DistinguishedName;
                 case cert_sha1_hash: SHA1Hash;
             } identifier;
         } TrustedAuthority;

         enum {
             pre_agreed(0), key_sha1_hash(1), x509_name(2),
             cert_sha1_hash(3), (255)
         } IdentifierType;

         opaque DistinguishedName<1..2^16-1>;

   Here "TrustedAuthorities" provides a list of CA root key identifiers
   that the client possesses.  Each CA root key is identified via
   either:

     -  "pre_agreed" - no CA root key identity supplied.

     -  "key_sha1_hash" - contains the SHA-1 hash of the CA root key.
   For
       DSA and ECDSA keys, this is the hash of the "subjectPublicKey"
       value.  For RSA keys, the hash is of the big-endian byte string
       representation of the modulus without any initial 0-valued bytes.
       (This copies the key hash formats deployed in other
       environments.)

     -  "x509_name" - contains the DER-encoded X.509 DistinguishedName
       of
       the CA.

     -  "cert_sha1_hash" - contains the SHA-1 hash of a DER-encoded
       Certificate containing the CA root key.

   Note that clients may include none, some, or all of the CA root keys
   they possess in this extension.

   Note also that it is possible that a key hash or a Distinguished Name
   alone may not uniquely identify a certificate issuer - for example if
   a particular CA has multiple key pairs - however here we assume this
   is the case following the use of Distinguished Names to identify
   certificate issuers in TLS.



Dierks & Rescorla            Standards Track                    [Page 46]draft-ietf-tls-rfc4346-bis-01.txt  TLS                         June 2006


   The option to include no CA root keys is included to allow the client
   to indicate possession of some pre-defined set of CA root keys.

   Servers that receive a client hello containing the "trusted_ca_keys"
   extension, MAY use the information contained in the extension to
   guide their selection of an appropriate certificate chain to return
   to the client.  In this event, the server SHALL include an extension
   of type "trusted_ca_keys" in the (extended) server hello.  The
   "extension_data" field of this extension SHALL be empty.
