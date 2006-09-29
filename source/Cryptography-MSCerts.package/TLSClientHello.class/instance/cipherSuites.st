accessing
cipherSuites
	"return a list of cipherSuites supported by the client as communicated by the client in the client hello
    CipherSuite TLS_RSA_WITH_NULL_MD5                  = { 0x00,0x01 };
    CipherSuite TLS_RSA_WITH_NULL_SHA                  = { 0x00,0x02 };
    CipherSuite TLS_RSA_WITH_RC4_128_MD5               = { 0x00,0x04 };
    CipherSuite TLS_RSA_WITH_RC4_128_SHA               = { 0x00,0x05 };
    CipherSuite TLS_RSA_WITH_IDEA_CBC_SHA              = { 0x00,0x07 };
    CipherSuite TLS_RSA_WITH_DES_CBC_SHA               = { 0x00,0x09 };
    CipherSuite TLS_RSA_WITH_3DES_EDE_CBC_SHA          = { 0x00,0x0A };
    CipherSuite TLS_RSA_WITH_AES_128_CBC_SHA           = { 0x00, 0x2F };
    CipherSuite TLS_RSA_WITH_AES_256_CBC_SHA           = { 0x00, 0x35 };
    CipherSuite TLS_DH_DSS_WITH_DES_CBC_SHA            = { 0x00,0x0C };
    CipherSuite TLS_DH_DSS_WITH_3DES_EDE_CBC_SHA       = { 0x00,0x0D };
    CipherSuite TLS_DH_RSA_WITH_DES_CBC_SHA            = { 0x00,0x0F };
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
    CipherSuite      TLS_KRB5_WITH_DES_CBC_SHA            = { 0x00,0x1E };
    CipherSuite      TLS_KRB5_WITH_3DES_EDE_CBC_SHA       = { 0x00,0x1F };
    CipherSuite      TLS_KRB5_WITH_RC4_128_SHA            = { 0x00,0x20 };
    CipherSuite      TLS_KRB5_WITH_IDEA_CBC_SHA           = { 0x00,0x21 };
    CipherSuite      TLS_KRB5_WITH_DES_CBC_MD5            = { 0x00,0x22 };
    CipherSuite      TLS_KRB5_WITH_3DES_EDE_CBC_MD5       = { 0x00,0x23 };
    CipherSuite      TLS_KRB5_WITH_RC4_128_MD5            = { 0x00,0x24 };
    CipherSuite      TLS_KRB5_WITH_IDEA_CBC_MD5           = { 0x00,0x25 };



	"
	^cipherSuites