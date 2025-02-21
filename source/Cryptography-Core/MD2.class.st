"
Message-Digest Algorithm 2
"
Class {
	#name : #MD2,
	#superclass : #HashFunction,
	#classVars : [
		'PITable'
	],
	#category : #'Cryptography-Core-MD4'
}

{ #category : #initialization }
MD2 class >> initialize [

	PITable := OrderedCollection new.
	
	self 
		initializeFirstHalfPITable;
		initializeSecondHalfPITable

]

{ #category : #'private - initialization' }
MD2 class >> initializeFirstHalfPITable [

	PITable addAll: {
		41. 46. 67. 201. 162. 216. 124. 1. 61. 54. 84. 161. 236. 240. 6.
		19. 98. 167. 5. 243. 192. 199. 115. 140. 152. 147. 43. 217. 188.
		76. 130. 202. 30. 155. 87. 60. 253. 212. 224. 22. 103. 66. 111. 24.
		138. 23. 229. 18. 190. 78. 196. 214. 218. 158. 222. 73. 160. 251.
		245. 142. 187. 47. 238. 122. 169. 104. 121. 145. 21. 178. 7. 63.
		148. 194. 16. 137. 11. 34. 95. 33. 128. 127. 93. 154. 90. 144. 50.
		39. 53. 62. 204. 231. 191. 247. 151. 3. 255. 25. 48. 179. 72. 165.
		181. 209. 215. 94. 146. 42. 172. 86. 170. 198. 79. 184. 56. 210.
		150. 164. 125. 182. 118. 252. 107. 226. 156. 116. 4. 241. 69. 157.
	}.

]

{ #category : #'private - initialization' }
MD2 class >> initializeSecondHalfPITable [

	PITable addAll: {
		112. 89. 100. 113. 135. 32. 134. 91. 207. 101. 230. 45. 168. 2. 27.
		96. 37. 173. 174. 176. 185. 246. 28. 70. 97. 105. 52. 64. 126. 15.
		85. 71. 163. 35. 221. 81. 175. 58. 195. 92. 249. 206. 186. 197.
		234. 38. 44. 83. 13. 110. 133. 40. 132. 9. 211. 223. 205. 244. 65.
		129. 77. 82. 106. 220. 55. 200. 108. 193. 171. 250. 36. 225. 123.
		8. 12. 189. 177. 74. 120. 136. 149. 139. 227. 99. 232. 109. 233.
		203. 213. 254. 59. 0. 29. 57. 242. 239. 183. 14. 102. 88. 208. 228.
		166. 119. 114. 248. 235. 117. 75. 10. 49. 68. 80. 180. 143. 237.
		31. 26. 219. 153. 141. 51. 159. 17. 131. 20
	}.

]

{ #category : #initialization }
MD2 class >> oidString [

	^ '1.2.840.113549.2.2'.

]

{ #category : #initialization }
MD2 class >> piTable [

	^ PITable
]

{ #category : #accessing }
MD2 >> appendChecksumToInput: input [

	| checksum l c |
	checksum := ByteArray new: 16 withAll: 0.
	l := 0.

	0 to: (input size // 16) - 1 do: [:i |
		1 to: 16 do: [:j |
			c := input at: (i * 16 + j).
			checksum at: j put: ((checksum at: j) bitXor: (self piTable at: (c bitXor: l) + 1)).
			l := checksum at: j]].

	^ input, checksum

]

{ #category : #accessing }
MD2 >> appendPaddingToInput: input [

	| paddingLength newInput |
	paddingLength := 16 - (input size \\ 16).
	newInput := input asByteArray, (ByteArray new: paddingLength withAll: paddingLength).
	newInput size \\ 16 = 0
		ifFalse: [self error: 'bad padding'].
	^ newInput

]

{ #category : #accessing }
MD2 >> hashMessage: aStringOrByteArray [

	| input |
	input := self appendPaddingToInput: aStringOrByteArray asByteArray.
	input := self appendChecksumToInput: input.
	^ self processBlocks: input.

]

{ #category : #accessing }
MD2 >> piTable [

	^ self class piTable.

]

{ #category : #accessing }
MD2 >> processBlocks: data [

	| buffer t |
	buffer := ByteArray new: 48 withAll: 0.
	0 to: (data size // 16) - 1 do: [:i |
		1 to: 16 do: [:j |
			buffer at: (16 + j) put: (data at: (i * 16 + j)).
			buffer at: (32 + j) put: ((buffer at: (16 + j)) bitXor: (buffer at: j))].
		t := 0.
		1 to: 18 do: [:j |
			1 to: 48 do: [:k |
				t := (buffer at: k) bitXor: (self piTable at: t + 1).
				buffer at: k put: t].
			t := (t+j-1) \\ 256]].
	^ buffer copyFrom: 1 to: 16.

]
