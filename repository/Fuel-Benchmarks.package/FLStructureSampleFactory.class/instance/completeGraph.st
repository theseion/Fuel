samples
completeGraph
	"Answer a complete graph of aproximately problemSize edges. A complete graph of n vertices has n*(n-1)/2 edges."

	| n vertices |
	n := (self problemSize * 2) sqrt rounded.
	vertices := (1 to: n) collect: [ :index | FLVariableDegreeGraphNode new ] as: Array.
	
	vertices do: [ :aNode | 
		aNode children: (vertices copyWithout: aNode) ].
	
	^ vertices