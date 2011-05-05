as yet unclassified
testEncryption
|key data res|
key:='abcdefghijklmnopqrstuvwxyz'.
data:=WordArray  new: 2.
#(16r424c4f57  16r46495348) doWithIndex: [:each :i | data at: i put: ((each asByteArray) unsignedLongAt: 1 bigEndian:true)    ].
res:=(Blowfish encrypt: data with:   key asByteArray).


self assert:((res at: 1) = 844026110). "16r324ed0fe"
self assert:((res at: 2) =  4094927363)."16rf413a203"