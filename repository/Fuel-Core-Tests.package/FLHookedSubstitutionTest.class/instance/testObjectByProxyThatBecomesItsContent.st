tests
testObjectByProxyThatBecomesItsContent
	"Tests a substitution of an object by a proxy that becomes another object on materialization."

	| aProxyClass result |
	aProxyClass := self classFactory silentlyMake: [ :aBuilder | aBuilder slotsFromString: 'someState' ].
	self classFactory
		silentlyCompile: 'initialize  someState := 5@1' in: aProxyClass;
		silentlyCompile: 'fuelAccept: aVisitor
			^ aVisitor
				visitSubstitution: self
				by: (' , FLProxyThatBecomesItsContent name , ' newWith: someState)'
		in: aProxyClass.

	result := self resultOfSerializeAndMaterialize: aProxyClass new.

	self assert: 5 @ 1 equals: result