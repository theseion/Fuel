class-factory
newInstanceFrom: aClassOrTrait
	^ (aClassOrTrait isTrait
		ifTrue: [
			(self classFactory
				newSubclassOf: Object
				using: aClassOrTrait) ]
		ifFalse: [ aClassOrTrait ]) new