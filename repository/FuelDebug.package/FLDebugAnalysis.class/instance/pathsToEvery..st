debugging
pathsToEvery: anUnaryBlock

	| referencesToAnObject result |
	referencesToAnObject := references select: [:association | 
		anUnaryBlock value: association value].

	result := referencesToAnObject.
	referencesToAnObject do: [:association |
		association key == root
			ifFalse: [result addAll: (self pathsTo: association key)]].
	^result