serialize/materialize layouts
superclassLayoutOf: aClassOrTrait
	^ aClassOrTrait superclass
			ifNotNil: [ :theSuperclass | theSuperclass classLayout ]
			ifNil: [
				"It's a trait"
				EmptyLayout instance]