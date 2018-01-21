private
edgeFor: anAssociation
	^ (ROEdge from: (self nodeFor: anAssociation key) to: (self nodeFor: anAssociation value))
		addShape: (ROLine new color: self edgeColor; add: (ROArrow new size: 4));
		yourself.