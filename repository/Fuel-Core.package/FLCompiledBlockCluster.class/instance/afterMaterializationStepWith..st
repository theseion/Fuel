serialize/materialize
afterMaterializationStepWith: aDecoder
	"Warn users that the method of a fully serialized block has changed.
	The block can be evaluated but the current form of the method might
	no longer include the closure or the closure implementation might have
	changed.
	NOTE: this method is intentionally not implemented as #fuelAfterMaterialization
		on the class because that method could potentially also be used by a global
		cluster."
	aDecoder configuration isMethodChangedWarningDisabled ifTrue: [
		^ self ].

	objects
		select: [ :block | self shouldWarnThatMethodChangedFor: block ]
		thenDo: [ :block |
			FLMethodChanged
				signalWith: block methodClass name
				and: block method selector ]