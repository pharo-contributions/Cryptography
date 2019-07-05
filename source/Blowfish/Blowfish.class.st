"
This is just enough of the Blowfish algorithm from 
http://www.openbsd.org/cgi-bin/cvsweb/~checkout~/src/lib/libc/crypt/blowfish.c

to be able to run BCrypt.  


Instance Variables:
	rounds	<AbstractSound | CalendarDuration | Collection | Color | DateAndTime | DhbDecimalFloatingNumber | DhbMatrix | DhbPolynomial | Duration | InfiniteDuration | Number | PassportNotAMetanumber | Point | ScientificDuration | TemporalInterval | Timespan | TraitComposition | TraitDescription | TraitTransformation>
	piArray	<Object>
	s0	<Matrix>
	s1	<Object>
	s2	<Object>
	s3	<Object>
	s4	<ProtoObject | PseudoContext>
	xl	<Integer>
	xr	<Integer>
	current	<Integer>
	key	<ProtoObject | PseudoContext>
	data	<Object>
"
Class {
	#name : #Blowfish,
	#superclass : #Object,
	#instVars : [
		'rounds',
		'piArray',
		's0',
		's1',
		's2',
		's3',
		'xl',
		'xr',
		'current',
		'key',
		'data',
		'index'
	],
	#category : 'Blowfish'
}

{ #category : #defaults }
Blowfish class >> blockSize [
	^8
]

{ #category : #decrypt }
Blowfish class >> decrypt: someData with: aKeyByteArray [
"use this when you have a wordArray"
	^self new decrypt: someData with: aKeyByteArray.
]

{ #category : #decrypt }
Blowfish class >> decryptString: aString with: aKey [
	|decryptedData |
	decryptedData := (self new ecbDecrypt: aString asByteArray with: aKey asByteArray  ).
        ^String fromByteArray:  decryptedData asByteArray .
]

{ #category : #decrypt }
Blowfish class >> decryptToString: someData with: aKey [
|decryptedData | 
decryptedData := (self new ecbDecrypt: someData with: aKey asByteArray  ).
	^String fromByteArray:  decryptedData asByteArray .
]

{ #category : #defaults }
Blowfish class >> defaultRounds [
^self minRounds
]

{ #category : #encrypt }
Blowfish class >> ecbDecrypt: someData with: aKey [
"use this when you have a byteArray"
	^self new ecbDecrypt: someData with: aKey.
]

{ #category : #encrypt }
Blowfish class >> ecbEncrypt: someData with: aKey [
"use this when you have a byteArray"
	^self new ecbEncrypt: someData with: aKey.
]

{ #category : #encrypt }
Blowfish class >> encrypt: someData with: aKey [
"use this when you have a wordArray"
	^self new encrypt: someData  with: aKey.
]

{ #category : #encrypt }
Blowfish class >> encryptString: someData with: aKeyString [
"use this with a string"
|dataToEncrypt |
dataToEncrypt :=OrderedCollection new.
someData do:[:each | dataToEncrypt add: each asciiValue ].
	^self new ecbEncrypt: dataToEncrypt asArray with: aKeyString asByteArray .
]

{ #category : #defaults }
Blowfish class >> maxRounds [
^20

]

{ #category : #defaults }
Blowfish class >> maxUserKeyLength [
	^448/8
]

{ #category : #defaults }
Blowfish class >> minRounds [
^16
]

{ #category : #defaults }
Blowfish class >> pBox [
	^#(		16r243F6A88 16r85A308D3 16r13198A2E 16r03707344 16rA4093822 16r299F31D0
			16r082EFA98 16rEC4E6C89 16r452821E6 16r38D01377 16rBE5466CF 16r34E90C6C
			16rC0AC29B7 16rC97C50DD 16r3F84D5B5 16rB5470917 16r9216D5D9 16r8979FB1B)
]

{ #category : #defaults }
Blowfish class >> s0Box [
	^#(16rD1310BA6 16r98DFB5AC 16r2FFD72DB 16rD01ADFB7
			16rB8E1AFED 16r6A267E96 16rBA7C9045 16rF12C7F99
			16r24A19947 16rB3916CF7 16r0801F2E2 16r858EFC16
			16r636920D8 16r71574E69 16rA458FEA3 16rF4933D7E
			16r0D95748F 16r728EB658 16r718BCD58 16r82154AEE
			16r7B54A41D 16rC25A59B5 16r9C30D539 16r2AF26013
			16rC5D1B023 16r286085F0 16rCA417918 16rB8DB38EF
			16r8E79DCB0 16r603A180E 16r6C9E0E8B 16rB01E8A3E
			16rD71577C1 16rBD314B27 16r78AF2FDA 16r55605C60
			16rE65525F3 16rAA55AB94 16r57489862 16r63E81440
			16r55CA396A 16r2AAB10B6 16rB4CC5C34 16r1141E8CE
			16rA15486AF 16r7C72E993 16rB3EE1411 16r636FBC2A
			16r2BA9C55D 16r741831F6 16rCE5C3E16 16r9B87931E
			16rAFD6BA33 16r6C24CF5C 16r7A325381 16r28958677
			16r3B8F4898 16r6B4BB9AF 16rC4BFE81B 16r66282193
			16r61D809CC 16rFB21A991 16r487CAC60 16r5DEC8032
			16rEF845D5D 16rE98575B1 16rDC262302 16rEB651B88
			16r23893E81 16rD396ACC5 16r0F6D6FF3 16r83F44239
			16r2E0B4482 16rA4842004 16r69C8F04A 16r9E1F9B5E
			16r21C66842 16rF6E96C9A 16r670C9C61 16rABD388F0
			16r6A51A0D2 16rD8542F68 16r960FA728 16rAB5133A3
			16r6EEF0B6C 16r137A3BE4 16rBA3BF050 16r7EFB2A98
			16rA1F1651D 16r39AF0176 16r66CA593E 16r82430E88
			16r8CEE8619 16r456F9FB4 16r7D84A5C3 16r3B8B5EBE
			16rE06F75D8 16r85C12073 16r401A449F 16r56C16AA6
			16r4ED3AA62 16r363F7706 16r1BFEDF72 16r429B023D
			16r37D0D724 16rD00A1248 16rDB0FEAD3 16r49F1C09B
			16r075372C9 16r80991B7B 16r25D479D8 16rF6E8DEF7
			16rE3FE501A 16rB6794C3B 16r976CE0BD 16r04C006BA
			16rC1A94FB6 16r409F60C4 16r5E5C9EC2 16r196A2463
			16r68FB6FAF 16r3E6C53B5 16r1339B2EB 16r3B52EC6F
			16r6DFC511F 16r9B30952C 16rCC814544 16rAF5EBD09
			16rBEE3D004 16rDE334AFD 16r660F2807 16r192E4BB3
			16rC0CBA857 16r45C8740F 16rD20B5F39 16rB9D3FBDB
			16r5579C0BD 16r1A60320A 16rD6A100C6 16r402C7279
			16r679F25FE 16rFB1FA3CC 16r8EA5E9F8 16rDB3222F8
			16r3C7516DF 16rFD616B15 16r2F501EC8 16rAD0552AB
			16r323DB5FA 16rFD238760 16r53317B48 16r3E00DF82
			16r9E5C57BB 16rCA6F8CA0 16r1A87562E 16rDF1769DB
			16rD542A8F6 16r287EFFC3 16rAC6732C6 16r8C4F5573
			16r695B27B0 16rBBCA58C8 16rE1FFA35D 16rB8F011A0
			16r10FA3D98 16rFD2183B8 16r4AFCB56C 16r2DD1D35B
			16r9A53E479 16rB6F84565 16rD28E49BC 16r4BFB9790
			16rE1DDF2DA 16rA4CB7E33 16r62FB1341 16rCEE4C6E8
			16rEF20CADA 16r36774C01 16rD07E9EFE 16r2BF11FB4
			16r95DBDA4D 16rAE909198 16rEAAD8E71 16r6B93D5A0
			16rD08ED1D0 16rAFC725E0 16r8E3C5B2F 16r8E7594B7
			16r8FF6E2FB 16rF2122B64 16r8888B812 16r900DF01C
			16r4FAD5EA0 16r688FC31C 16rD1CFF191 16rB3A8C1AD
			16r2F2F2218 16rBE0E1777 16rEA752DFE 16r8B021FA1
			16rE5A0CC0F 16rB56F74E8 16r18ACF3D6 16rCE89E299
			16rB4A84FE0 16rFD13E0B7 16r7CC43B81 16rD2ADA8D9
			16r165FA266 16r80957705 16r93CC7314 16r211A1477
			16rE6AD2065 16r77B5FA86 16rC75442F5 16rFB9D35CF
			16rEBCDAF0C 16r7B3E89A0 16rD6411BD3 16rAE1E7E49
			16r00250E2D 16r2071B35E 16r226800BB 16r57B8E0AF
			16r2464369B 16rF009B91E 16r5563911D 16r59DFA6AA
			16r78C14389 16rD95A537F 16r207D5BA2 16r02E5B9C5
			16r83260376 16r6295CFA9 16r11C81968 16r4E734A41
			16rB3472DCA 16r7B14A94A 16r1B510052 16r9A532915
			16rD60F573F 16rBC9BC6E4 16r2B60A476 16r81E67400
			16r08BA6FB5 16r571BE91F 16rF296EC6B 16r2A0DD915
			16rB6636521 16rE7B9F9B6 16rFF34052E 16rC5855664
			16r53B02D5D 16rA99F8FA1 16r08BA4799 16r6E85076A	)
]

{ #category : #defaults }
Blowfish class >> s1Box [
	^#(16r4B7A70E9 16rB5B32944 16rDB75092E 16rC4192623
			16rAD6EA6B0 16r49A7DF7D 16r9CEE60B8 16r8FEDB266
			16rECAA8C71 16r699A17FF 16r5664526C 16rC2B19EE1
			16r193602A5 16r75094C29 16rA0591340 16rE4183A3E
			16r3F54989A 16r5B429D65 16r6B8FE4D6 16r99F73FD6
			16rA1D29C07 16rEFE830F5 16r4D2D38E6 16rF0255DC1
			16r4CDD2086 16r8470EB26 16r6382E9C6 16r021ECC5E
			16r09686B3F 16r3EBAEFC9 16r3C971814 16r6B6A70A1
			16r687F3584 16r52A0E286 16rB79C5305 16rAA500737
			16r3E07841C 16r7FDEAE5C 16r8E7D44EC 16r5716F2B8
			16rB03ADA37 16rF0500C0D 16rF01C1F04 16r0200B3FF
			16rAE0CF51A 16r3CB574B2 16r25837A58 16rDC0921BD
			16rD19113F9 16r7CA92FF6 16r94324773 16r22F54701
			16r3AE5E581 16r37C2DADC 16rC8B57634 16r9AF3DDA7
			16rA9446146 16r0FD0030E 16rECC8C73E 16rA4751E41
			16rE238CD99 16r3BEA0E2F 16r3280BBA1 16r183EB331
			16r4E548B38 16r4F6DB908 16r6F420D03 16rF60A04BF
			16r2CB81290 16r24977C79 16r5679B072 16rBCAF89AF
			16rDE9A771F 16rD9930810 16rB38BAE12 16rDCCF3F2E
			16r5512721F 16r2E6B7124 16r501ADDE6 16r9F84CD87
			16r7A584718 16r7408DA17 16rBC9F9ABC 16rE94B7D8C
			16rEC7AEC3A 16rDB851DFA 16r63094366 16rC464C3D2
			16rEF1C1847 16r3215D908 16rDD433B37 16r24C2BA16
			16r12A14D43 16r2A65C451 16r50940002 16r133AE4DD
			16r71DFF89E 16r10314E55 16r81AC77D6 16r5F11199B
			16r043556F1 16rD7A3C76B 16r3C11183B 16r5924A509
			16rF28FE6ED 16r97F1FBFA 16r9EBABF2C 16r1E153C6E
			16r86E34570 16rEAE96FB1 16r860E5E0A 16r5A3E2AB3
			16r771FE71C 16r4E3D06FA 16r2965DCB9 16r99E71D0F
			16r803E89D6 16r5266C825 16r2E4CC978 16r9C10B36A
			16rC6150EBA 16r94E2EA78 16rA5FC3C53 16r1E0A2DF4
			16rF2F74EA7 16r361D2B3D 16r1939260F 16r19C27960
			16r5223A708 16rF71312B6 16rEBADFE6E 16rEAC31F66
			16rE3BC4595 16rA67BC883 16rB17F37D1 16r018CFF28
			16rC332DDEF 16rBE6C5AA5 16r65582185 16r68AB9802
			16rEECEA50F 16rDB2F953B 16r2AEF7DAD 16r5B6E2F84
			16r1521B628 16r29076170 16rECDD4775 16r619F1510
			16r13CCA830 16rEB61BD96 16r0334FE1E 16rAA0363CF
			16rB5735C90 16r4C70A239 16rD59E9E0B 16rCBAADE14
			16rEECC86BC 16r60622CA7 16r9CAB5CAB 16rB2F3846E
			16r648B1EAF 16r19BDF0CA 16rA02369B9 16r655ABB50
			16r40685A32 16r3C2AB4B3 16r319EE9D5 16rC021B8F7
			16r9B540B19 16r875FA099 16r95F7997E 16r623D7DA8
			16rF837889A 16r97E32D77 16r11ED935F 16r16681281
			16r0E358829 16rC7E61FD6 16r96DEDFA1 16r7858BA99
			16r57F584A5 16r1B227263 16r9B83C3FF 16r1AC24696
			16rCDB30AEB 16r532E3054 16r8FD948E4 16r6DBC3128
			16r58EBF2EF 16r34C6FFEA 16rFE28ED61 16rEE7C3C73
			16r5D4A14D9 16rE864B7E3 16r42105D14 16r203E13E0
			16r45EEE2B6 16rA3AAABEA 16rDB6C4F15 16rFACB4FD0
			16rC742F442 16rEF6ABBB5 16r654F3B1D 16r41CD2105
			16rD81E799E 16r86854DC7 16rE44B476A 16r3D816250
			16rCF62A1F2 16r5B8D2646 16rFC8883A0 16rC1C7B6A3
			16r7F1524C3 16r69CB7492 16r47848A0B 16r5692B285
			16r095BBF00 16rAD19489D 16r1462B174 16r23820E00
			16r58428D2A 16r0C55F5EA 16r1DADF43E 16r233F7061
			16r3372F092 16r8D937E41 16rD65FECF1 16r6C223BDB
			16r7CDE3759 16rCBEE7460 16r4085F2A7 16rCE77326E
			16rA6078084 16r19F8509E 16rE8EFD855 16r61D99735
			16rA969A7AA 16rC50C06C2 16r5A04ABFC 16r800BCADC
			16r9E447A2E 16rC3453484 16rFDD56705 16r0E1E9EC9
			16rDB73DBD3 16r105588CD 16r675FDA79 16rE3674340
			16rC5C43465 16r713E38D8 16r3D28F89E 16rF16DFF20
			16r153E21E7 16r8FB03D4A 16rE6E39F2B 16rDB83ADF7)
]

{ #category : #defaults }
Blowfish class >> s2Box [
	^#(16rE93D5A68 16r948140F7 16rF64C261C 16r94692934
			16r411520F7 16r7602D4F7 16rBCF46B2E 16rD4A20068
			16rD4082471 16r3320F46A 16r43B7D4B7 16r500061AF
			16r1E39F62E 16r97244546 16r14214F74 16rBF8B8840
			16r4D95FC1D 16r96B591AF 16r70F4DDD3 16r66A02F45
			16rBFBC09EC 16r03BD9785 16r7FAC6DD0 16r31CB8504
			16r96EB27B3 16r55FD3941 16rDA2547E6 16rABCA0A9A
			16r28507825 16r530429F4 16r0A2C86DA 16rE9B66DFB
			16r68DC1462 16rD7486900 16r680EC0A4 16r27A18DEE
			16r4F3FFEA2 16rE887AD8C 16rB58CE006 16r7AF4D6B6
			16rAACE1E7C 16rD3375FEC 16rCE78A399 16r406B2A42
			16r20FE9E35 16rD9F385B9 16rEE39D7AB 16r3B124E8B
			16r1DC9FAF7 16r4B6D1856 16r26A36631 16rEAE397B2
			16r3A6EFA74 16rDD5B4332 16r6841E7F7 16rCA7820FB
			16rFB0AF54E 16rD8FEB397 16r454056AC 16rBA489527
			16r55533A3A 16r20838D87 16rFE6BA9B7 16rD096954B
			16r55A867BC 16rA1159A58 16rCCA92963 16r99E1DB33
			16rA62A4A56 16r3F3125F9 16r5EF47E1C 16r9029317C
			16rFDF8E802 16r04272F70 16r80BB155C 16r05282CE3
			16r95C11548 16rE4C66D22 16r48C1133F 16rC70F86DC
			16r07F9C9EE 16r41041F0F 16r404779A4 16r5D886E17
			16r325F51EB 16rD59BC0D1 16rF2BCC18F 16r41113564
			16r257B7834 16r602A9C60 16rDFF8E8A3 16r1F636C1B
			16r0E12B4C2 16r02E1329E 16rAF664FD1 16rCAD18115
			16r6B2395E0 16r333E92E1 16r3B240B62 16rEEBEB922
			16r85B2A20E 16rE6BA0D99 16rDE720C8C 16r2DA2F728
			16rD0127845 16r95B794FD 16r647D0862 16rE7CCF5F0
			16r5449A36F 16r877D48FA 16rC39DFD27 16rF33E8D1E
			16r0A476341 16r992EFF74 16r3A6F6EAB 16rF4F8FD37
			16rA812DC60 16rA1EBDDF8 16r991BE14C 16rDB6E6B0D
			16rC67B5510 16r6D672C37 16r2765D43B 16rDCD0E804
			16rF1290DC7 16rCC00FFA3 16rB5390F92 16r690FED0B
			16r667B9FFB 16rCEDB7D9C 16rA091CF0B 16rD9155EA3
			16rBB132F88 16r515BAD24 16r7B9479BF 16r763BD6EB
			16r37392EB3 16rCC115979 16r8026E297 16rF42E312D
			16r6842ADA7 16rC66A2B3B 16r12754CCC 16r782EF11C
			16r6A124237 16rB79251E7 16r06A1BBE6 16r4BFB6350
			16r1A6B1018 16r11CAEDFA 16r3D25BDD8 16rE2E1C3C9
			16r44421659 16r0A121386 16rD90CEC6E 16rD5ABEA2A
			16r64AF674E 16rDA86A85F 16rBEBFE988 16r64E4C3FE
			16r9DBC8057 16rF0F7C086 16r60787BF8 16r6003604D
			16rD1FD8346 16rF6381FB0 16r7745AE04 16rD736FCCC
			16r83426B33 16rF01EAB71 16rB0804187 16r3C005E5F
			16r77A057BE 16rBDE8AE24 16r55464299 16rBF582E61
			16r4E58F48F 16rF2DDFDA2 16rF474EF38 16r8789BDC2
			16r5366F9C3 16rC8B38E74 16rB475F255 16r46FCD9B9
			16r7AEB2661 16r8B1DDF84 16r846A0E79 16r915F95E2
			16r466E598E 16r20B45770 16r8CD55591 16rC902DE4C
			16rB90BACE1 16rBB8205D0 16r11A86248 16r7574A99E
			16rB77F19B6 16rE0A9DC09 16r662D09A1 16rC4324633
			16rE85A1F02 16r09F0BE8C 16r4A99A025 16r1D6EFE10
			16r1AB93D1D 16r0BA5A4DF 16rA186F20F 16r2868F169
			16rDCB7DA83 16r573906FE 16rA1E2CE9B 16r4FCD7F52
			16r50115E01 16rA70683FA 16rA002B5C4 16r0DE6D027
			16r9AF88C27 16r773F8641 16rC3604C06 16r61A806B5
			16rF0177A28 16rC0F586E0 16r006058AA 16r30DC7D62
			16r11E69ED7 16r2338EA63 16r53C2DD94 16rC2C21634
			16rBBCBEE56 16r90BCB6DE 16rEBFC7DA1 16rCE591D76
			16r6F05E409 16r4B7C0188 16r39720A3D 16r7C927C24
			16r86E3725F 16r724D9DB9 16r1AC15BB4 16rD39EB8FC
			16rED545578 16r08FCA5B5 16rD83D7CD3 16r4DAD0FC4
			16r1E50EF5E 16rB161E6F8 16rA28514D9 16r6C51133C
			16r6FD5C7E7 16r56E14EC4 16r362ABFCE 16rDDC6C837
			16rD79A3234 16r92638212 16r670EFA8E 16r406000E0)
]

{ #category : #defaults }
Blowfish class >> s3Box [
	^#(16r3A39CE37 16rD3FAF5CF 16rABC27737 16r5AC52D1B
			16r5CB0679E 16r4FA33742 16rD3822740 16r99BC9BBE
			16rD5118E9D 16rBF0F7315 16rD62D1C7E 16rC700C47B
			16rB78C1B6B 16r21A19045 16rB26EB1BE 16r6A366EB4
			16r5748AB2F 16rBC946E79 16rC6A376D2 16r6549C2C8
			16r530FF8EE 16r468DDE7D 16rD5730A1D 16r4CD04DC6
			16r2939BBDB 16rA9BA4650 16rAC9526E8 16rBE5EE304
			16rA1FAD5F0 16r6A2D519A 16r63EF8CE2 16r9A86EE22
			16rC089C2B8 16r43242EF6 16rA51E03AA 16r9CF2D0A4
			16r83C061BA 16r9BE96A4D 16r8FE51550 16rBA645BD6
			16r2826A2F9 16rA73A3AE1 16r4BA99586 16rEF5562E9
			16rC72FEFD3 16rF752F7DA 16r3F046F69 16r77FA0A59
			16r80E4A915 16r87B08601 16r9B09E6AD 16r3B3EE593
			16rE990FD5A 16r9E34D797 16r2CF0B7D9 16r022B8B51
			16r96D5AC3A 16r017DA67D 16rD1CF3ED6 16r7C7D2D28
			16r1F9F25CF 16rADF2B89B 16r5AD6B472 16r5A88F54C
			16rE029AC71 16rE019A5E6 16r47B0ACFD 16rED93FA9B
			16rE8D3C48D 16r283B57CC 16rF8D56629 16r79132E28
			16r785F0191 16rED756055 16rF7960E44 16rE3D35E8C
			16r15056DD4 16r88F46DBA 16r03A16125 16r0564F0BD
			16rC3EB9E15 16r3C9057A2 16r97271AEC 16rA93A072A
			16r1B3F6D9B 16r1E6321F5 16rF59C66FB 16r26DCF319
			16r7533D928 16rB155FDF5 16r03563482 16r8ABA3CBB
			16r28517711 16rC20AD9F8 16rABCC5167 16rCCAD925F
			16r4DE81751 16r3830DC8E 16r379D5862 16r9320F991
			16rEA7A90C2 16rFB3E7BCE 16r5121CE64 16r774FBE32
			16rA8B6E37E 16rC3293D46 16r48DE5369 16r6413E680
			16rA2AE0810 16rDD6DB224 16r69852DFD 16r09072166
			16rB39A460A 16r6445C0DD 16r586CDECF 16r1C20C8AE
			16r5BBEF7DD 16r1B588D40 16rCCD2017F 16r6BB4E3BB
			16rDDA26A7E 16r3A59FF45 16r3E350A44 16rBCB4CDD5
			16r72EACEA8 16rFA6484BB 16r8D6612AE 16rBF3C6F47
			16rD29BE463 16r542F5D9E 16rAEC2771B 16rF64E6370
			16r740E0D8D 16rE75B1357 16rF8721671 16rAF537D5D
			16r4040CB08 16r4EB4E2CC 16r34D2466A 16r0115AF84
			16rE1B00428 16r95983A1D 16r06B89FB4 16rCE6EA048
			16r6F3F3B82 16r3520AB82 16r011A1D4B 16r277227F8
			16r611560B1 16rE7933FDC 16rBB3A792B 16r344525BD
			16rA08839E1 16r51CE794B 16r2F32C9B7 16rA01FBAC9
			16rE01CC87E 16rBCC7D1F6 16rCF0111C3 16rA1E8AAC7
			16r1A908749 16rD44FBD9A 16rD0DADECB 16rD50ADA38
			16r0339C32A 16rC6913667 16r8DF9317C 16rE0B12B4F
			16rF79E59B7 16r43F5BB3A 16rF2D519FF 16r27D9459C
			16rBF97222C 16r15E6FC2A 16r0F91FC71 16r9B941525
			16rFAE59361 16rCEB69CEB 16rC2A86459 16r12BAA8D1
			16rB6C1075E 16rE3056A0C 16r10D25065 16rCB03A442
			16rE0EC6E0E 16r1698DB3B 16r4C98A0BE 16r3278E964
			16r9F1F9532 16rE0D392DF 16rD3A0342B 16r8971F21E
			16r1B0A7441 16r4BA3348C 16rC5BE7120 16rC37632D8
			16rDF359F8D 16r9B992F2E 16rE60B6F47 16r0FE3F11D
			16rE54CDA54 16r1EDAD891 16rCE6279CF 16rCD3E7E6F
			16r1618B166 16rFD2C1D05 16r848FD2C5 16rF6FB2299
			16rF523F357 16rA6327623 16r93A83531 16r56CCCD02
			16rACF08162 16r5A75EBB5 16r6E163697 16r88D273CC
			16rDE966292 16r81B949D0 16r4C50901B 16r71C65614
			16rE6C6C7BD 16r327A140A 16r45E1D006 16rC3F27B9A
			16rC9AA53FD 16r62A80F00 16rBB25BFE2 16r35BDD2F6
			16r71126905 16rB2040222 16rB6CBCF7C 16rCD769C2B
			16r53113EC0 16r1640E3D3 16r38ABBD60 16r2547ADF0
			16rBA38209C 16rF746CE76 16r77AFA1C5 16r20756060
			16r85CBFE4E 16r8AE88DD8 16r7AAAF9B0 16r4CF9AA7E
			16r1948C25C 16r02FB8A8C 16r01C36AE4 16rD6EBE1F9
			16r90D4F869 16rA65CDEA0 16r3F09252D 16rC208E69F
			16rB74E6132 16rCE77E25B 16r578FDFE3 16r3AC372E6)
]

{ #category : #'as yet unclassified' }
Blowfish >> blfDec: dataArray for: blocks [
	| j newDataArray |
	newDataArray := Array new: dataArray size.
	j := 1.
	(1 to: blocks)
		do: [ :each | 
			xl := dataArray at: j.
			xr := dataArray at: j + 1.
			self decipher.
			newDataArray at: j put: xl.
			newDataArray at: j + 1 put: xr.
			j := j + 2 ].
	^ newDataArray
]

{ #category : #'as yet unclassified' }
Blowfish >> blfEcbDecrypt: dataArray for: times [

 |  newDataArray |
newDataArray:=dataArray copy.

	(1 to: times by: 8) do:[ :each | 
		
		xl:=((((newDataArray at: 1) bitShift: 24) bitOr: ((newDataArray at: 2) bitShift: 16) )bitOr: ((newDataArray at: 3) bitShift: 8)) bitOr: (newDataArray at: 4).  
		xr:=((((newDataArray at: 5) bitShift: 24) bitOr: ((newDataArray at: 6) bitShift: 16) )bitOr: ((newDataArray at: 7) bitShift: 8)) bitOr: (newDataArray at: 8).
		
		self decipher .
		
		newDataArray at: 1 put: ((xl  bitShift: -24) bitAnd: 16rff).		
		newDataArray at: 2 put: ((xl  bitShift: -16) bitAnd: 16rff).	
		newDataArray at: 3 put: ((xl  bitShift: -8) bitAnd: 16rff).	
		newDataArray at: 4 put: (xl bitAnd: 16rff).
		newDataArray at: 5 put: ((xr  bitShift: -24) bitAnd: 16rff).	
		newDataArray at: 6 put: ((xr  bitShift: -16) bitAnd: 16rff).
		newDataArray at: 7 put: ((xr  bitShift: -8) bitAnd: 16rff).	
		newDataArray at: 8 put: (xr bitAnd: 16rff).	
		]	.
		
	^newDataArray 
]

{ #category : #'as yet unclassified' }
Blowfish >> blfEcbEncrypt: dataArray for: times [

 |  newDataArray |
newDataArray:=dataArray copy.

	(1 to: times by: 8) do:[ :each | 
		
		xl:=((((newDataArray at: 1) bitShift: 24) bitOr: ((newDataArray at: 2) bitShift: 16) )bitOr: ((newDataArray at: 3) bitShift: 8)) bitOr: (newDataArray at: 4).  
		xr:=((((newDataArray at: 5) bitShift: 24) bitOr: ((newDataArray at: 6) bitShift: 16) )bitOr: ((newDataArray at: 7) bitShift: 8)) bitOr: (newDataArray at: 8).
		
		self encipher .
		
		newDataArray at: 1 put: ((xl  bitShift: -24) bitAnd: 16rff).		
		newDataArray at: 2 put: ((xl  bitShift: -16) bitAnd: 16rff).	
		newDataArray at: 3 put: ((xl  bitShift: -8) bitAnd: 16rff).	
		newDataArray at: 4 put: (xl bitAnd: 16rff).
		newDataArray at: 5 put: ((xr  bitShift: -24) bitAnd: 16rff).	
		newDataArray at: 6 put: ((xr  bitShift: -16) bitAnd: 16rff).
		newDataArray at: 7 put: ((xr  bitShift: -8) bitAnd: 16rff).	
		newDataArray at: 8 put: (xr bitAnd: 16rff).	
		]	.
		
	^newDataArray 
]

{ #category : #'as yet unclassified' }
Blowfish >> blfEnc: dataArray for: blocks [
	| j newDataArray |
	newDataArray := dataArray copy.
	j := 1.
	(1 to: blocks)
		do: [ :each | 
			xl := newDataArray at: j.
			xr := newDataArray at: j + 1.
			self encipher.
			newDataArray at: j put: xl.
			newDataArray at: j + 1 put: xr.
			j := j + 2 ].
	^ newDataArray
]

{ #category : #'as yet unclassified' }
Blowfish >> blfKey: aKey [
	index:=0.
	key:= aKey.
	"self initializeLittleEndianBoxes."
	self initializeBoxes.
	self expandZeroState.
]

{ #category : #'as yet unclassified' }
Blowfish >> calculateBlfRndFor:oneHalf with: otherHalf andPiAt: n [
"#define BLFRND(s,p,i,j,n) (i ^= F(s,j) ^ (p)[n])"

	
^ oneHalf bitXor: ((self feistelWith: otherHalf  ) bitXor: (piArray at: n)) .

]

{ #category : #'as yet unclassified' }
Blowfish >> decipher [
	| xL xR temp |
	xL := xl copy.
	xR := xr copy.
	xL := xL bitXor: (piArray at: 18).
	(17 to: 2 by: -2)
		do: [ :each | 
			xR := self calculateBlfRndFor: xR with: xL andPiAt: each.
			xL := self calculateBlfRndFor: xL with: xR andPiAt: each - 1 ].
	xl := xR bitXor: (piArray at: 1).
	xr := xL
]

{ #category : #'as yet unclassified' }
Blowfish >> decrypt: someData with:   aKeyString [

	
	self setRounds: self class defaultRounds .

	self blfKey: aKeyString.
	^self blfDec: someData for: someData size // 2.
]

{ #category : #'as yet unclassified' }
Blowfish >> ecbDecrypt: someData with:   aKeyString [


	self setRounds: self class defaultRounds .

	self blfKey: aKeyString.
	^self blfEcbDecrypt: someData for: someData size // 2.
]

{ #category : #'as yet unclassified' }
Blowfish >> ecbEncrypt: someData with:   aKeyString [


	self setRounds: self class defaultRounds .

	self blfKey: aKeyString.
	^self blfEcbEncrypt: someData for: someData size // 2.
]

{ #category : #'as yet unclassified' }
Blowfish >> encipher [
	| xL xR temp |
	xL := xl copy.
	xR := xr copy.
	xL := xL bitXor: (piArray at: 1).
"	index <= 2
		ifTrue: [ 
			Transcript
				cr;
				show: 'New encipher';
				cr;
				show: 'Left: ';
				show: xL hex greaseString ]."
	(2 to: 17 by: 2)
		do: [ :each | 
			xR := self calculateBlfRndFor: xR with: xL andPiAt: each.
			xL := self calculateBlfRndFor: xL with: xR andPiAt: each + 1.
"			index = 2
				ifTrue: [ 
					Transcript
						cr;
						show: 'Right: ';
						show: xR hex greaseString;
						cr;
						show: 'Left: ';
						show: xL hex greaseString.
					index = 0 ] ]."].
	xR := xR bitXor: (piArray at: 18).
	xl := xR.
	xr := xL
]

{ #category : #'as yet unclassified' }
Blowfish >> encrypt: someData with:   aKeyString [


	self setRounds: self class defaultRounds .

	self blfKey: aKeyString.
	
	^self blfEnc: someData  for: someData size // 2.
]

{ #category : #'as yet unclassified' }
Blowfish >> expandZeroState [
	| dataL dataR s0Test s1Test s2Test s3Test  pTest|
	current := 1.
pTest:=piArray copy.
	(1 to: rounds + 2)
		do: [ :each | piArray at: each put: ((piArray at: each) bitXor: (self stream2word: key)) ].

"xl := 16r0.
xr := 16r0."
xl:=#[0 0 0 0] unsignedLongAt: 1 bigEndian:   true.
xr:=#[0 0 0 0] unsignedLongAt: 1 bigEndian:   true.
pTest:=piArray copy.
		(1 to: rounds + 2 by: 2)
		do: [ :each | 		
			self encipher.
					piArray at: each put: xl copy.
					piArray at: each+1 put: xr copy.].

s0Test :=s0 copy.
s1Test :=s1 copy.
s2Test :=s2 copy.
s3Test :=s3 copy.



		(1 to:256 by:2)
		do: [ :each | self encipher.
					s0 at: each put: xl copy.
					s0 at: each+1 put: xr copy.
					].

		(1 to:256 by:2)
		do: [ :each | self encipher.
					s1 at: each put: xl copy.
					s1 at: each+1 put: xr copy.].

		(1 to:256 by:2)
		do: [ :each | self encipher.
					s2 at: each put: xl copy.
					s2 at: each+1 put: xr copy.].

		(1 to:256 by:2)
		do: [ :each | self encipher.
					s3 at: each put: xl copy.
					s3 at: each+1 put: xr copy.].
			
"	s0Test:= s0 select:[:each | each asByteArray size >4].
	s1Test:= s1 select:[:each | each asByteArray size >4].
	s2Test:= s2 select:[:each | each asByteArray size >4].
	s3Test:= s3 select:[:each | each asByteArray size >4].
	(s0Test size + s1Test size + s2Test size + s3Test size) >0 ifTrue:[self halt]."
]

{ #category : #'as yet unclassified' }
Blowfish >> feistelWith: otherHalf [
	| a b c d y byteArray |
	a := ((otherHalf bitShift: -24) bitAnd: 16rff) + 1.
	b := ((otherHalf bitShift: -16) bitAnd: 16rff) + 1.
	c := ((otherHalf bitShift: -8) bitAnd: 16rff) + 1.
	d := (otherHalf bitAnd: 16rff) + 1.
	y := ((s0 at: a) + (s1 at: b)) \\ 4294967296.	" (2 raisedTo: 32)"
	y := y bitXor: (s2 at: c).
	y := (y + (s3 at: d)) \\ 4294967296.	"(2 raisedTo: 32)"
	^ y
]

{ #category : #'as yet unclassified' }
Blowfish >> initializeBoxes [
	piArray :=self class pBox copy.
	s0:=self class s0Box copy.
	s1:=self class s1Box copy.
	s2:=self class s2Box copy.
	s3:=self class s3Box copy.

	
	
]

{ #category : #'as yet unclassified' }
Blowfish >> setRounds: anInteger [

	rounds:=(anInteger >= self class minRounds and:[anInteger <= self class maxRounds]) ifTrue: [anInteger] ifFalse:[self class defaultRounds ]   
]

{ #category : #'as yet unclassified' }
Blowfish >> stream2word: someData [ 


|temp j dataBytes |
temp:=0.

dataBytes := someData size.

1 to: 4 do:  [ :each | 
		temp:=(temp bitShift: 8 ) bitOr: ((someData at: current) bitAnd: 16rFF).

	current := (current \\ dataBytes) +1.

	   ].


^temp.

]

{ #category : #'as yet unclassified' }
Blowfish >> stream2word: someData length: someBytes [


|temp j  |
temp:=0.



1 to: 4 do:  [ :each | 
		temp:=(temp bitShift: 8 ) bitOr: ((someData atWrap: current) bitAnd: 16rFF).

	current := (current \\ someBytes) +1.

	   ].


^temp.

]
