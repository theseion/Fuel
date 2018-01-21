tests
testProblemOfSmallSize
	"Problem size aproximately states the size of the built sample."

	| factory smallSample bigSample |
	factory := FLNumberSampleFactory new
		selector: #smallIntegers.
	
	smallSample := factory problemSize: 1; asSample.
	bigSample := factory problemSize: 100; asSample.

	self assert: smallSample content size < bigSample content size.
