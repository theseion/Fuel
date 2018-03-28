traits-factory
registerBehavior: aBehavior
	aBehavior isTrait
		ifTrue: [ self classFactory createdTraits add: aBehavior ]
		ifFalse: [ self classFactory createdClasses add: aBehavior ]