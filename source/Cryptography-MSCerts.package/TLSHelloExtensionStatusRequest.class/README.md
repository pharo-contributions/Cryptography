7.4.1.4.6 Certificate Status Request http://www.ietf.org/internet-drafts/draft-ietf-tls-rfc4346-bis-01.txt

   Constrained clients may wish to use a certificate-status protocol
   such as OCSP [OCSP] to check the validity of server certificates, in
   order to avoid transmission of CRLs and therefore save bandwidth on
   constrained networks.  This extension allows for such information to
   be sent in the TLS handshake, saving roundtrips and resources.

   In order to indicate their desire to receive certificate status
   information, clients MAY include an extension of type
   "status_request" in the (extended) client hello.  The
   "extension_data" field of this extension SHALL contain
   "CertificateStatusRequest" where:

         struct {
             CertificateStatusType status_type;
             select (status_type) {
                 case ocsp: OCSPStatusRequest;
             } request;
         } CertificateStatusRequest;

         enum { ocsp(1), (255) } CertificateStatusType;

         struct {
             ResponderID responder_id_list<0..2^16-1>;
             Extensions  request_extensions;
         } OCSPStatusRequest;

         opaque ResponderID<1..2^16-1>;

   In the OCSPStatusRequest, the "ResponderIDs" provides a list of OCSP
   responders that the client trusts.  A zero-length "responder_id_list"
   sequence has the special meaning that the responders are implicitly
   known to the server - e.g., by prior arrangement.  "Extensions" is a
   DER encoding of OCSP request extensions.

   Both "ResponderID" and "Extensions" are DER-encoded ASN.1 types as
   defined in [OCSP].  "Extensions" is imported from [PKIX].  A zero-
   length "request_extensions" value means that there are no extensions
   (as opposed to a zero-length ASN.1 SEQUENCE, which is not valid for
   the "Extensions" type).

   In the case of the "id-pkix-ocsp-nonce" OCSP extension, [OCSP] is
   unclear about its encoding; for clarification, the nonce MUST be a
   DER-encoded OCTET STRING, which is encapsulated as another OCTET
   STRING (note that implementations based on an existing OCSP client
   will need to be checked for conformance to this requirement).




Dierks & Rescorla            Standards Track                    [Page 48]draft-ietf-tls-rfc4346-bis-01.txt  TLS                         June 2006


   Servers that receive a client hello containing the "status_request"
   extension, MAY return a suitable certificate status response to the
   client along with their certificate.  If OCSP is requested, they
   SHOULD use the information contained in the extension when selecting
   an OCSP responder, and SHOULD include request_extensions in the OCSP
   request.

   Servers return a certificate response along with their certificate by
   sending a "CertificateStatus" message immediately after the
   "Certificate" message (and before any "ServerKeyExchange" or
   "CertificateRequest" messages). Section XXX describes the
   CertificateStatus message.
