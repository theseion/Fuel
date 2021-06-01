accessing
registerBehavior: aBehavior
	(aBehavior isTrait
		ifTrue: [ self createdTraits ]
		ifFalse: [ self createdClasses ]) add: aBehavior