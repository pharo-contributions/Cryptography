"
Instances of this class can be used to permute bits in an integer according to a predefined mapping. It's used for DES encryption in several places.
"
Class {
	#name : #DESBitPermutation,
	#superclass : #Object,
	#instVars : [
		'tables'
	],
	#classVars : [
		'ChunkBits',
		'ChunkMask'
	],
	#category : 'Cryptography-DES'
}

{ #category : #'instance creation' }
DESBitPermutation class >> fromBitIndexes: aCollection [
	"aCollection are bit indexes counting from the right, unlike the DES spec which counts from the left"
	"Example: the key permutation table for DES
	self fromBitIndexes: (#(
		57	49	41	33	25	17	9
		1	58	50	42	34	26	18
		10	2	59	51	43	35	27
		19	11	3	60	52	44	36
		63	55	47	39	31	23	15
		7	62	54	46	38	30	22
		14	6	61	53	45	37	29
		21	13	5	28	20	12	4) reverse collect: [:i | 64-i])"
	| permutation |
	permutation := self new initialize.
	aCollection doWithIndex: [:srcBit :dstBit | permutation map: srcBit to: dstBit-1].
	^permutation
]

{ #category : #'instance creation' }
DESBitPermutation class >> fromDESBitIndexes: aCollection sourceWidth: sourceWidth [
	"aCollection are bit indexes counting from the right, unlike the DES spec which counts from the left"
	"Example: the key permutation table for DES
	self fromDESBitIndexes: #(
		57	49	41	33	25	17	9
		1	58	50	42	34	26	18
		10	2	59	51	43	35	27
		19	11	3	60	52	44	36
		63	55	47	39	31	23	15
		7	62	54	46	38	30	22
		14	6	61	53	45	37	29
		21	13	5	28	20	12	4) sourceWidth: 64"
	^self fromBitIndexes: (aCollection reverse collect: [:i | sourceWidth-i])
]

{ #category : #'class initialization' }
DESBitPermutation class >> initialize [
	"DESBitPermutation initialize"
	ChunkBits := 6.
	ChunkMask := (1 bitShift: ChunkBits) - 1
]

{ #category : #'initialize-release' }
DESBitPermutation >> initialize [
	tables := #()
]

{ #category : #'initialize-release' }
DESBitPermutation >> map: srcBit to: dstBit [
	| i mask array bit |
	i := srcBit // ChunkBits + 1.
	[tables size < i] whileTrue: [tables := tables copyWith: (Array new: ChunkMask+1 withAll: 0)].
	mask := 1 bitShift: (srcBit \\ ChunkBits).
	array := tables at: i.
	bit := 1 bitShift: dstBit.
	0 to: ChunkMask do: [:index |
		(index bitAnd: mask) = mask ifTrue: [
			array at: index+1 put: ((array at: index+1) bitOr: bit)]]
]

{ #category : #permuting }
DESBitPermutation >> permute: input [
	| output shift bits |
	output := 0.
	shift := 0.
	tables do: [:array |
		bits := (input bitShift: shift) bitAnd: ChunkMask.
		output := output + (array at: bits+1).
		shift := shift - ChunkBits].
	^output
]
