4.4  Extensions http://www.ietf.org/rfc/rfc2560.txt

   This section defines some standard extensions, based on the extension
   model employed in X.509 version 3 certificates see [RFC2459]. Support
   for all extensions is optional for both clients and responders.  For



Myers, et al.               Standards Track                    [Page 11]

RFC 2560                       PKIX OCSP                       June 1999


   each extension, the definition indicates its syntax, processing
   performed by the OCSP Responder, and any extensions which are
   included in the corresponding response.

4.4.1  Nonce

   The nonce cryptographically binds a request and a response to prevent
   replay attacks. The nonce is included as one of the requestExtensions
   in requests, while in responses it would be included as one of the
   responseExtensions. In both the request and the response, the nonce
   will be identified by the object identifier id-pkix-ocsp-nonce, while
   the extnValue is the value of the nonce.

   id-pkix-ocsp-nonce     OBJECT IDENTIFIER ::= { id-pkix-ocsp 2 }

4.4.2  CRL References

   It may be desirable for the OCSP responder to indicate the CRL on
   which a revoked or onHold certificate is found. This can be useful
   where OCSP is used between repositories, and also as an auditing
   mechanism. The CRL may be specified by a URL (the URL at which the
   CRL is available), a number (CRL number) or a time (the time at which
   the relevant CRL was created). These extensions will be specified as
   singleExtensions. The identifier for this extension will be id-pkix-
   ocsp-crl, while the value will be CrlID.

   id-pkix-ocsp-crl       OBJECT IDENTIFIER ::= { id-pkix-ocsp 3 }

   CrlID ::= SEQUENCE {
      crlUrl               [0]     EXPLICIT IA5String OPTIONAL,
      crlNum               [1]     EXPLICIT INTEGER OPTIONAL,
      crlTime              [2]     EXPLICIT GeneralizedTime OPTIONAL }

   For the choice crlUrl, the IA5String will specify the URL at which
   the CRL is available. For crlNum, the INTEGER will specify the value
   of the CRL number extension of the relevant CRL. For crlTime, the
   GeneralizedTime will indicate the time at which the relevant CRL was
   issued.

4.4.3  Acceptable Response Types

   An OCSP client MAY wish to specify the kinds of response types it
   understands. To do so, it SHOULD use an extension with the OID id-
   pkix-ocsp-response, and the value AcceptableResponses.  This
   extension is included as one of the requestExtensions in requests.
   The OIDs included in AcceptableResponses are the OIDs of the various
   response types this client can accept (e.g., id-pkix-ocsp-basic).




Myers, et al.               Standards Track                    [Page 12]

RFC 2560                       PKIX OCSP                       June 1999


   id-pkix-ocsp-response  OBJECT IDENTIFIER ::= { id-pkix-ocsp 4 }

   AcceptableResponses ::= SEQUENCE OF OBJECT IDENTIFIER

   As noted in section 4.2.1, OCSP responders SHALL be capable of
   responding with responses of the id-pkix-ocsp-basic response type.
   Correspondingly, OCSP clients SHALL be capable of receiving and
   processing responses of the id-pkix-ocsp-basic response type.

4.4.4  Archive Cutoff

   An OCSP responder MAY choose to retain revocation information beyond
   a certificate's expiration. The date obtained by subtracting this
   retention interval value from the producedAt time in a response is
   defined as the certificate's "archive cutoff" date.

   OCSP-enabled applications would use an OCSP archive cutoff date to
   contribute to a proof that a digital signature was (or was not)
   reliable on the date it was produced even if the certificate needed
   to validate the signature has long since expired.

   OCSP servers that provide support for such historical reference
   SHOULD include an archive cutoff date extension in responses.  If
   included, this value SHALL be provided as an OCSP singleExtensions
   extension identified by id-pkix-ocsp-archive-cutoff and of syntax
   GeneralizedTime.

   id-pkix-ocsp-archive-cutoff  OBJECT IDENTIFIER ::= { id-pkix-ocsp 6 }

   ArchiveCutoff ::= GeneralizedTime

   To illustrate, if a server is operated with a 7-year retention
   interval policy and status was produced at time t1 then the value for
   ArchiveCutoff in the response would be (t1 - 7 years).

4.4.5  CRL Entry Extensions

   All the extensions specified as CRL Entry Extensions - in Section 5.3
   of [RFC2459] - are also supported as singleExtensions.

4.4.6  Service Locator

   An OCSP server may be operated in a mode whereby the server receives
   a request and routes it to the OCSP server which is known to be
   authoritative for the identified certificate.  The serviceLocator
   request extension is defined for this purpose.  This extension is
   included as one of the singleRequestExtensions in requests.




Myers, et al.               Standards Track                    [Page 13]

RFC 2560                       PKIX OCSP                       June 1999


   id-pkix-ocsp-service-locator OBJECT IDENTIFIER ::= { id-pkix-ocsp 7 }

   ServiceLocator ::= SEQUENCE {
       issuer    Name,
       locator   AuthorityInfoAccessSyntax OPTIONAL }

   Values for these fields are obtained from the corresponding fields in
   the subject certificate.



5.3  CRL Entry Extensions  http://www.ietf.org/rfc/rfc2459.txt

   The CRL entry extensions already defined by ANSI X9 and ISO/IEC/ITU
   for X.509 v2 CRLs provide methods for associating additional
   attributes with CRL entries [X.509] [X9.55].  The X.509 v2 CRL format
   also allows communities to define private CRL entry extensions to
   carry information unique to those communities.  Each extension in a
   CRL entry may be designated as critical or non-critical.  A CRL
   validation MUST fail if it encounters a critical CRL entry extension
   which it does not know how to process.  However, an unrecognized
   non-critical CRL entry extension may be ignored.  The following
   subsections present recommended extensions used within Internet CRL
   entries and standard locations for information.  Communities may
   elect to use additional CRL entry extensions; however, caution should
   be exercised in adopting any critical extensions in CRL entries which
   might be used in a general context.

   All CRL entry extensions used in this specification are non-critical.
   Support for these extensions is optional for conforming CAs and
   applications.  However, CAs that issue CRLs SHOULD include reason
   codes (see sec. 5.3.1) and invalidity dates (see sec. 5.3.3) whenever
   this information is available.




Housley, et. al.            Standards Track                    [Page 49]

RFC 2459        Internet X.509 Public Key Infrastructure    January 1999


5.3.1  Reason Code

   The reasonCode is a non-critical CRL entry extension that identifies
   the reason for the certificate revocation. CAs are strongly
   encouraged to include meaningful reason codes in CRL entries;
   however, the reason code CRL entry extension SHOULD be absent instead
   of using the unspecified (0) reasonCode value.

   id-ce-cRLReason OBJECT IDENTIFIER ::= { id-ce 21 }

   -- reasonCode ::= { CRLReason }

   CRLReason ::= ENUMERATED {
        unspecified             (0),
        keyCompromise           (1),
        cACompromise            (2),
        affiliationChanged      (3),
        superseded              (4),
        cessationOfOperation    (5),
        certificateHold         (6),
        removeFromCRL           (8) }

5.3.2  Hold Instruction Code

   The hold instruction code is a non-critical CRL entry extension that
   provides a registered instruction identifier which indicates the
   action to be taken after encountering a certificate that has been
   placed on hold.

   id-ce-holdInstructionCode OBJECT IDENTIFIER ::= { id-ce 23 }

   holdInstructionCode ::= OBJECT IDENTIFIER

   The following instruction codes have been defined.  Conforming
   applications that process this extension MUST recognize the following
   instruction codes.

   holdInstruction    OBJECT IDENTIFIER ::=
                    { iso(1) member-body(2) us(840) x9-57(10040) 2 }

   id-holdinstruction-none   OBJECT IDENTIFIER ::= {holdInstruction 1}
   id-holdinstruction-callissuer
                             OBJECT IDENTIFIER ::= {holdInstruction 2}
   id-holdinstruction-reject OBJECT IDENTIFIER ::= {holdInstruction 3}

   Conforming applications which encounter an id-holdinstruction-
   callissuer MUST call the certificate issuer or reject the
   certificate.  Conforming applications which encounter an id-



Housley, et. al.            Standards Track                    [Page 50]

RFC 2459        Internet X.509 Public Key Infrastructure    January 1999


   holdinstruction-reject MUST reject the certificate. The hold
   instruction id-holdinstruction-none is semantically equivalent to the
   absence of a holdInstructionCode, and its use is strongly deprecated
   for the Internet PKI.

5.3.3  Invalidity Date

   The invalidity date is a non-critical CRL entry extension that
   provides the date on which it is known or suspected that the private
   key was compromised or that the certificate otherwise became invalid.
   This date may be earlier than the revocation date in the CRL entry,
   which is the date at which the CA processed the revocation. When a
   revocation is first posted by a CA in a CRL, the invalidity date may
   precede the date of issue of earlier CRLs, but the revocation date
   SHOULD NOT precede the date of issue of earlier CRLs.  Whenever this
   information is available, CAs are strongly encouraged to share it
   with CRL users.

   The GeneralizedTime values included in this field MUST be expressed
   in Greenwich Mean Time (Zulu), and MUST be specified and interpreted
   as defined in section 4.1.2.5.2.

   id-ce-invalidityDate OBJECT IDENTIFIER ::= { id-ce 24 }

   invalidityDate ::=  GeneralizedTime

5.3.4  Certificate Issuer

   This CRL entry extension identifies the certificate issuer associated
   with an entry in an indirect CRL, i.e. a CRL that has the indirectCRL
   indicator set in its issuing distribution point extension. If this
   extension is not present on the first entry in an indirect CRL, the
   certificate issuer defaults to the CRL issuer. On subsequent entries
   in an indirect CRL, if this extension is not present, the certificate
   issuer for the entry is the same as that for the preceding entry.
   This field is defined as follows:

   id-ce-certificateIssuer   OBJECT IDENTIFIER ::= { id-ce 29 }

   certificateIssuer ::=     GeneralNames

   If used by conforming CAs that issue CRLs, this extension is always
   critical.  If an implementation ignored this extension it could not
   correctly attribute CRL entries to certificates.  This specification
   RECOMMENDS that implementations recognize this extension.
