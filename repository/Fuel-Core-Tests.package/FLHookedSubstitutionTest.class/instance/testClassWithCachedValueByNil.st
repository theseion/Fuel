tests
testClassWithCachedValueByNil

	| aClassWithCachedValue result original |
	aClassWithCachedValue := self classFactory silentlyMake: [ :aBuilder | aBuilder slotsFromString: 'cache' ].
	self classFactory
		silentlyCompile: 'cache ^cache' in: aClassWithCachedValue;
		silentlyCompile: 'cache: x cache := x' in: aClassWithCachedValue;
		silentlyCompile: '
			fuelAccept: aVisitor  
				^cache 
					ifNil: [ super fuelAccept: aVisitor ]
					ifNotNil: [
						aVisitor
							visitSubstitution: self
							by: (self copy cache: nil)]'
		in: aClassWithCachedValue.

	original := aClassWithCachedValue new
		            cache: 5;
		            yourself.

	result := self resultOfSerializeAndMaterialize: original.

	self assert: result cache isNil