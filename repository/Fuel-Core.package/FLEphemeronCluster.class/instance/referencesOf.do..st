analyzing
referencesOf: anObject do: aBlock
	"Do not store strong reference to the key, which is essentially a weak reference.
	Do not trace the key either. We only want to serialize the key if there's an
	explicit reference to it in the graph."
	| key |
	key := anObject key.
	variablesMapping
		referencesOf: anObject
		do: [ :object |
			object == key ifFalse: [
				aBlock value: object ] ]