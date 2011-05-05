as yet unclassified
testDecryption
|key data res|
key:='abcdefghijklmnopqrstuvwxyz'.
data:=WordArray  new: 2.
#(16r324ed0fe  16rf413a203) doWithIndex: [:each :i | data at: i put: ((each asByteArray) unsignedLongAt: 1 bigEndian:true)    ].
res:=(Blowfish decrypt: data with:  key asByteArray ).


self assert:((res at: 1) =  1112297303). "16r424c4f571"
self assert:((res at: 2) =   1179210568)."16r46495348"