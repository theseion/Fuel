class-factory
newInstanceFrom: aClassOrTrait
	^ (aClassOrTrait isTrait
		ifTrue: [
			(self classFactory
				silentlyNewSubclassOf: Object
				uses: aClassOrTrait) ]
		ifFalse: [ aClassOrTrait ]) new