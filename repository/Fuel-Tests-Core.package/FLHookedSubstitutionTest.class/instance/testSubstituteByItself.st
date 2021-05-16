tests
testSubstituteByItself
	| aRecursiveClass result | 
	aRecursiveClass := (self newSubclassOf: Object instanceVariableNames: '' classVariableNames: '') 
		duringTestCompileSilently: 'fuelAccept: aMapper  
			^aMapper 
				visitSubstitution: self by: self 
				onRecursionDo: [super fuelAccept: aMapper]';
		yourself.

	"Fail fast so the image doesn't crash if we end up in an endless loop"
	result := [ self resultOfSerializeAndMaterialize: aRecursiveClass new ]
		valueWithin: 1 second
		onTimeout: [ self fail ].
	
	"shouldn't lead to endless loop"
	self assert: result class identicalTo: aRecursiveClass