tests
testAsSample

	| sample |
	sample := FLNumberSampleFactory new
		selector: #smallIntegers;
		asSample.
	
	self assert: sample title = 'smallIntegers'.
	self deny: sample content isEmpty.
	self assert: sample content anyOne isInteger.