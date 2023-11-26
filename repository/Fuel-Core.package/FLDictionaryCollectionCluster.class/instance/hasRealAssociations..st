testing
hasRealAssociations: aDictionary
	"Weak assocations and ephemerons should not be serialized as simple key / value tuples
	but with their actual class.

	Only check the first association, assume that all other entries
	are of the same type"
	aDictionary associationsDo: [ :assoc |
		^ assoc class == Association ].
	
	^ true