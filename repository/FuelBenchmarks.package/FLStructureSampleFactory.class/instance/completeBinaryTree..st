private
completeBinaryTree: index

	| children left right |
	children := OrderedCollection new.
	left := index // 2 - 1.
	right := index // 2.
	left > 0 ifTrue: [ children add: (self completeBinaryTree: left) ].
	right > 0 ifTrue: [ children add: (self completeBinaryTree: right) ].

	^ FLVariableDegreeGraphNode newWith: children asArray