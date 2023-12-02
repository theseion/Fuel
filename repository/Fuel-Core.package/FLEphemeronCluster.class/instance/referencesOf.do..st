analyzing
referencesOf: anObject do: aBlock
	"Do not trace the key. We only want to serialize the key if there's an
	explicit reference to it in the graph.
	See #serializeReferencesOf:with:"
	| key |
	key := anObject key.
	variablesMapping
		referencesOf: anObject
		do: [ :object |
			object == key ifFalse: [
				aBlock value: object ] ]