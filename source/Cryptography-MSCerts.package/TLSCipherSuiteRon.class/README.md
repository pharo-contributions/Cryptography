A.5. The CipherSuite    http://www.ietf.org/internet-drafts/draft-ietf-tls-rfc4346-bis-01.txt

   The following values define the CipherSuite codes used in the client
   hello and server hello messages.

   A CipherSuite defines a cipher specification supported in TLS Version
   1.1.

   TLS_NULL_WITH_NULL_NULL is specified and is the initial state of a
   TLS connection during the first handshake on that channel, but must
   not be negotiated, as it provides no more protection than an
   unsecured connection.

    CipherSuite TLS_NULL_WITH_NULL_NULL                = { 0x00,0x00 };

   The following CipherSuite definitions require that the server provide
   an RSA certificate that can be used for key exchange. The server may
   request either an RSA or a DSS signature-capable certificate in the
   certificate request message.

    CipherSuite TLS_RSA_WITH_NULL_MD5                  = { 0x00,0x01 };
    CipherSuite TLS_RSA_WITH_NULL_SHA                  = { 0x00,0x02 };
    CipherSuite TLS_RSA_WITH_RC4_128_MD5               = { 0x00,0x04 };
    CipherSuite TLS_RSA_WITH_RC4_128_SHA               = { 0x00,0x05 };
    CipherSuite TLS_RSA_WITH_IDEA_CBC_SHA              = { 0x00,0x07 };
    CipherSuite TLS_RSA_WITH_DES_CBC_SHA               = { 0x00,0x09 };
    CipherSuite TLS_RSA_WITH_3DES_EDE_CBC_SHA          = { 0x00,0x0A };
    CipherSuite TLS_RSA_WITH_AES_128_CBC_SHA           = { 0x00, 0x2F };
    CipherSuite TLS_RSA_WITH_AES_256_CBC_SHA           = { 0x00, 0x35 };
   The following CipherSuite definitions are used for server-
   authenticated (and optionally client-authenticated) Diffie-Hellman.
   DH denotes cipher suites in which the server's certificate contains
   the Diffie-Hellman parameters signed by the certificate authority
   (CA). DHE denotes ephemeral Diffie-Hellman, where the Diffie-Hellman
   parameters are signed by a DSS or RSA certificate, which has been
   signed by the CA. The signing algorithm used is specified after the
   DH or DHE parameter. The server can request an RSA or DSS signature-
   capable certificate from the client for client authentication or it
   may request a Diffie-Hellman certificate. Any Diffie-Hellman
   certificate provided by the client must use the parameters (group and
   generator) described by the server.

    CipherSuite TLS_DH_DSS_WITH_DES_CBC_SHA            = { 0x00,0x0C };
    CipherSuite TLS_DH_DSS_WITH_3DES_EDE_CBC_SHA       = { 0x00,0x0D };
    CipherSuite TLS_DH_RSA_WITH_DES_CBC_SHA            = { 0x00,0x0F };



Dierks & Rescorla            Standards Track                    [Page 80]draft-ietf-tls-rfc4346-bis-01.txt  TLS                         June 2006


    CipherSuite TLS_DH_RSA_WITH_3DES_EDE_CBC_SHA       = { 0x00,0x10 };
    CipherSuite TLS_DHE_DSS_WITH_DES_CBC_SHA           = { 0x00,0x12 };
    CipherSuite TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA      = { 0x00,0x13 };
    CipherSuite TLS_DHE_RSA_WITH_DES_CBC_SHA           = { 0x00,0x15 };
    CipherSuite TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA      = { 0x00,0x16 };
    CipherSuite TLS_DH_DSS_WITH_AES_128_CBC_SHA        = { 0x00, 0x30 };
    CipherSuite TLS_DH_RSA_WITH_AES_128_CBC_SHA        = { 0x00, 0x31 };
    CipherSuite TLS_DHE_DSS_WITH_AES_128_CBC_SHA       = { 0x00, 0x32 };
    CipherSuite TLS_DHE_RSA_WITH_AES_128_CBC_SHA       = { 0x00, 0x33 };
    CipherSuite TLS_DH_anon_WITH_AES_128_CBC_SHA       = { 0x00, 0x34 };
    CipherSuite TLS_DH_DSS_WITH_AES_256_CBC_SHA        = { 0x00, 0x36 };
    CipherSuite TLS_DH_RSA_WITH_AES_256_CBC_SHA        = { 0x00, 0x37 };
    CipherSuite TLS_DHE_DSS_WITH_AES_256_CBC_SHA       = { 0x00, 0x38 };
    CipherSuite TLS_DHE_RSA_WITH_AES_256_CBC_SHA       = { 0x00, 0x39 };
    CipherSuite TLS_DH_anon_WITH_AES_256_CBC_SHA       = { 0x00, 0x3A };

   The following cipher suites are used for completely anonymous Diffie-
   Hellman communications in which neither party is authenticated. Note
   that this mode is vulnerable to man-in-the-middle attacks and is
   therefore deprecated.

    CipherSuite TLS_DH_anon_WITH_RC4_128_MD5           = { 0x00,0x18 };
    CipherSuite TLS_DH_anon_WITH_DES_CBC_SHA           = { 0x00,0x1A };
    CipherSuite TLS_DH_anon_WITH_3DES_EDE_CBC_SHA      = { 0x00,0x1B };

   When SSLv3 and TLS 1.0 were designed, the United States restricted
   the export of cryptographic software containing certain strong
   encryption algorithms. A series of cipher suites were designed to
   operate at reduced key lengths in order to comply with those
   regulations. Due to advances in computer performance, these
   algorithms are now unacceptably weak and export restrictions have
   since been loosened. TLS 1.1 implementations MUST NOT negotiate these
   cipher suites in TLS 1.1 mode. However, for backward compatibility
   they may be offered in the ClientHello for use with TLS 1.0 or SSLv3
   only servers. TLS 1.1 clients MUST check that the server did not
   choose one of these cipher suites during the handshake. These
   ciphersuites are listed below for informational purposes and to
   reserve the numbers.

    CipherSuite TLS_RSA_EXPORT_WITH_RC4_40_MD5         = { 0x00,0x03 };
    CipherSuite TLS_RSA_EXPORT_WITH_RC2_CBC_40_MD5     = { 0x00,0x06 };
    CipherSuite TLS_RSA_EXPORT_WITH_DES40_CBC_SHA      = { 0x00,0x08 };
    CipherSuite TLS_DH_DSS_EXPORT_WITH_DES40_CBC_SHA   = { 0x00,0x0B };
    CipherSuite TLS_DH_RSA_EXPORT_WITH_DES40_CBC_SHA   = { 0x00,0x0E };
    CipherSuite TLS_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA  = { 0x00,0x11 };
    CipherSuite TLS_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA  = { 0x00,0x14 };
    CipherSuite TLS_DH_anon_EXPORT_WITH_RC4_40_MD5     = { 0x00,0x17 };
    CipherSuite TLS_DH_anon_EXPORT_WITH_DES40_CBC_SHA  = { 0x00,0x19 };



Dierks & Rescorla            Standards Track                    [Page 81]draft-ietf-tls-rfc4346-bis-01.txt  TLS                         June 2006


   The following cipher suites were defined in [TLSKRB] and are included
   here for completeness. See [TLSKRB] for details:

    CipherSuite      TLS_KRB5_WITH_DES_CBC_SHA            = { 0x00,0x1E };
    CipherSuite      TLS_KRB5_WITH_3DES_EDE_CBC_SHA       = { 0x00,0x1F };
    CipherSuite      TLS_KRB5_WITH_RC4_128_SHA            = { 0x00,0x20 };
    CipherSuite      TLS_KRB5_WITH_IDEA_CBC_SHA           = { 0x00,0x21 };
    CipherSuite      TLS_KRB5_WITH_DES_CBC_MD5            = { 0x00,0x22 };
    CipherSuite      TLS_KRB5_WITH_3DES_EDE_CBC_MD5       = { 0x00,0x23 };
    CipherSuite      TLS_KRB5_WITH_RC4_128_MD5            = { 0x00,0x24 };
    CipherSuite      TLS_KRB5_WITH_IDEA_CBC_MD5           = { 0x00,0x25 };

   The following exportable cipher suites were defined in [TLSKRB] and
   are included here for completeness. TLS 1.1 implementations MUST NOT
   negotiate these cipher suites.

    CipherSuite      TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA  = { 0x00,0x26
   };
    CipherSuite      TLS_KRB5_EXPORT_WITH_RC2_CBC_40_SHA  = { 0x00,0x27
   };
    CipherSuite      TLS_KRB5_EXPORT_WITH_RC4_40_SHA      = { 0x00,0x28
   };
    CipherSuite      TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5  = { 0x00,0x29
   };
    CipherSuite      TLS_KRB5_EXPORT_WITH_RC2_CBC_40_MD5  = { 0x00,0x2A
   };
    CipherSuite      TLS_KRB5_EXPORT_WITH_RC4_40_MD5      = { 0x00,0x2B
   };


 The cipher suite space is divided into three regions:

       1. Cipher suite values with first byte 0x00 (zero)
          through decimal 191 (0xBF) inclusive are reserved for the IETF
          Standards Track protocols.

       2. Cipher suite values with first byte decimal 192 (0xC0)
          through decimal 254 (0xFE) inclusive are reserved
          for assignment for non-Standards Track methods.

       3. Cipher suite values with first byte 0xFF are
          reserved for private use.
   Additional information describing the role of IANA in the allocation
   of cipher suite code points is described in Section 11.

 Note: The cipher suite values { 0x00, 0x1C } and { 0x00, 0x1D } are
   reserved to avoid collision with Fortezza-based cipher suites in SSL
   3.
