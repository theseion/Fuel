serialize/materialize layouts
superclassSlotSizeOf: aClassOrTrait
	^ aClassOrTrait superclass
		ifNotNil: [ :theSuperclass | theSuperclass allSlots size ]
		ifNil: [
			"It's a trait"
			0 ]