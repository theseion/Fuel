tests
testObjectByProxyThatBecomesItsContent
	"Tests a substitution of an object by a proxy that becomes another object on materialization."

	| aProxyClass result |
	aProxyClass := (self classFactory silentlyNewClassWithInstanceVariableNames: 'someState')
		duringTestCompileSilently: 'initialize  someState := 5@1';
		duringTestCompileSilently: 'fuelAccept: aVisitor  ^aVisitor visitSubstitution: self by: (FLProxyThatBecomesItsContent newWith: someState)';
		yourself.

	result := self resultOfSerializeAndMaterialize: aProxyClass new.

	self assert: 5 @ 1 equals: result