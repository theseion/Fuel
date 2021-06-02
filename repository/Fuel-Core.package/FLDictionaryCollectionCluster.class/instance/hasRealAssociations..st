testing
hasRealAssociations: aDictionary
	"Only check the first association, assume that all other entries
	are of the same type"
	aDictionary associationsDo: [ :assoc |
		^ #(
			Association
			WeakKeyAssociation
			WeakValueAssociation
		) includes: assoc className ].
	
	^ true