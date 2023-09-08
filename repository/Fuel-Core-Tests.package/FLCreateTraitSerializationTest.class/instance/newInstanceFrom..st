class-factory
newInstanceFrom: aClassOrTrait

	^ (aClassOrTrait isTrait
		   ifTrue: [ self classFactory silentlyMake: [ :aBuilder | aBuilder traitComposition: aClassOrTrait ] ]
		   ifFalse: [ aClassOrTrait ]) new