class initialization
initializeSuites
	AllSuites _ Dictionary new.
	AllSuites at: '0001' put: #'TLS_RSA_WITH_NULL_MD5' "{ 0x00,0x01 }";
    at: '0002' put: #'TLS_RSA_WITH_NULL_SHA'             "{ 0x00,0x02 }";
    at: '0004' put: #'TLS_RSA_WITH_RC4_128_MD5'          "{ 0x00,0x04 }";
    at: '0005' put: #'TLS_RSA_WITH_RC4_128_SHA'          "{ 0x00,0x05 }";
    at: '0007' put: #'TLS_RSA_WITH_IDEA_CBC_SHA'         "{ 0x00,0x07 }";
    at: '0009' put: #'TLS_RSA_WITH_DES_CBC_SHA'          "{ 0x00,0x09 }";
    at: '000A' put: #'TLS_RSA_WITH_3DES_EDE_CBC_SHA'   "{ 0x00,0x0A }";
    at: '002F' put: #'TLS_RSA_WITH_AES_128_CBC_SHA'     "{ 0x00, 0x2F }";
    at: '0035' put: #'TLS_RSA_WITH_AES_256_CBC_SHA'     "{ 0x00, 0x35 }";
    at: '000C' put: #'TLS_DH_DSS_WITH_DES_CBC_SHA'        "{ 0x00,0x0C }";
    at: '000D' put: #'TLS_DH_DSS_WITH_3DES_EDE_CBC_SHA'   "{ 0x00,0x0D }";
    at: '000F' put: #'TLS_DH_RSA_WITH_DES_CBC_SHA'        "{ 0x00,0x0F }";
    at: '0010' put: #'TLS_DH_RSA_WITH_3DES_EDE_CBC_SHA'   "{ 0x00,0x10 }";
    at: '0012' put: #'TLS_DHE_DSS_WITH_DES_CBC_SHA'       "{ 0x00,0x12 }";
    at: '0013' put: #'TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA'  "{ 0x00,0x13 }";
    at: '0015' put: #'TLS_DHE_RSA_WITH_DES_CBC_SHA'       "{ 0x00,0x15 }";
    at: '0016' put: #'TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA'  "{ 0x00,0x16 }";
    at: '0030' put: #'TLS_DH_DSS_WITH_AES_128_CBC_SHA'    "{ 0x00, 0x30 }";
    at: '0031' put: #'TLS_DH_RSA_WITH_AES_128_CBC_SHA'    "{ 0x00, 0x31 }";
    at: '0032' put: #'TLS_DHE_DSS_WITH_AES_128_CBC_SHA'   "{ 0x00, 0x32 }";
    at: '0033' put: #'TLS_DHE_RSA_WITH_AES_128_CBC_SHA'   "{ 0x00, 0x33 }";
    at: '0034' put: #'TLS_DH_anon_WITH_AES_128_CBC_SHA'   "{ 0x00, 0x34 }";
    at: '0036' put: #'TLS_DH_DSS_WITH_AES_256_CBC_SHA'    "{ 0x00, 0x36 }";
    at: '0037' put: #'TLS_DH_RSA_WITH_AES_256_CBC_SHA'    "{ 0x00, 0x37 }";
    at: '0038' put: #'TLS_DHE_DSS_WITH_AES_256_CBC_SHA'   "{ 0x00, 0x38 }";
    at: '0039' put: #'TLS_DHE_RSA_WITH_AES_256_CBC_SHA'   "{ 0x00, 0x39 }";
    at: '003A' put: #'TLS_DH_anon_WITH_AES_256_CBC_SHA'   "{ 0x00, 0x3A }";
    at: '001E' put: #'TLS_KRB5_WITH_DES_CBC_SHA'           "{ 0x00,0x1E }";
    at: '001F' put: #'TLS_KRB5_WITH_3DES_EDE_CBC_SHA'      "{ 0x00,0x1F }";
    at: '0020' put: #'TLS_KRB5_WITH_RC4_128_SHA'           "{ 0x00,0x20 }";
    at: '0021' put: #'TLS_KRB5_WITH_IDEA_CBC_SHA'          "{ 0x00,0x21 }";
    at: '0022' put: #'TLS_KRB5_WITH_DES_CBC_MD5'           "{ 0x00,0x22 }";
    at: '0023' put: #'TLS_KRB5_WITH_3DES_EDE_CBC_MD5'      "{ 0x00,0x23 }";
    at: '0024' put: #'TLS_KRB5_WITH_RC4_128_MD5'           "{ 0x00,0x24 }";
    at: '0025' put: #'TLS_KRB5_WITH_IDEA_CBC_MD5'          "{ 0x00,0x25 }";
	"SSL 2.0 compatibility suites"
    at: '010080' put: #'TLS_RC4_128_WITH_MD5'			   "{ 0x01,0x00,0x80 }";
    at: '020080' put: #'TLS_RC4_128_EXPORT40_WITH_MD5'    "{ 0x02,0x00,0x80 }";
    at: '030080' put: #'TLS_RC2_CBC_128_CBC_WITH_MD5'      "{ 0x03,0x00,0x80 }";
    at: '040080' put: #'TLS_RC2_CBC_128_CBC_EXPORT40_WITH_MD5'  "{ 0x04,0x00,0x80 }";
    at: '050080' put: #'TLS_IDEA_128_CBC_WITH_MD5'          "{ 0x05,0x00,0x80 }";
    at: '060040' put: #'TLS_DES_64_CBC_WITH_MD5'            "{ 0x06,0x00,0x40 }";
    at: '0700C0' put: #'TLS_DES_192_EDE3_CBC_WITH_MD5'     "{ 0x07,0x00,0xC0 }".



