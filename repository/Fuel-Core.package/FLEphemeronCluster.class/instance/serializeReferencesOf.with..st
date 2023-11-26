serialize/materialize
serializeReferencesOf: anObject with: anEncoder
	"As we did not trace the key we can simply encode it here,
	provided it was strongly referenced from within the graph."
	anEncoder encodeWeakReferenceTo: anObject key.
	
	"The references do not contain the key"
	super
		serializeReferencesOf: anObject
		with: anEncoder