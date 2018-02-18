debugging
pathsTo: anObject excluding: excludedObjects

	| referencesToAnObject result |
	(excludedObjects includes: anObject)
		ifTrue: [^Array new].
	referencesToAnObject := references select: [:association |
		 anObject == association value ].

	result := referencesToAnObject.
	referencesToAnObject do: [:association |
		association key == root
			ifFalse: [result addAll: (
				self pathsTo: association key 
				excluding: excludedObjects, {anObject})]].
	^result