samples
regularGraphOfFixedDegree
	"Answer a regular graph of aproximately problemSize vertices."

	| n vertices |
	n := (self problemSize // 20) * 8.
	vertices := (1 to: n) collect: [ :index | FLFixedDegreeGraphNode new ] as: Array.

	1 to: n do: [ :index | 
		| aNode |
		aNode := vertices at: index.
		aNode child1: (vertices atWrap: index + 1).
		aNode child2: (vertices atWrap: index + 2).
		aNode child3: (vertices atWrap: index + 3).
		aNode child4: (vertices atWrap: index + 4).
		aNode child5: (vertices atWrap: index + 5).
		aNode child6: (vertices atWrap: index + 6).
		aNode child7: (vertices atWrap: index + 7).
		aNode child8: (vertices atWrap: index + 8).
	 ].
	
	^ vertices