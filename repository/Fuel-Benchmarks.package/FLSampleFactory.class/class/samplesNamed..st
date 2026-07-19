sample creation
samplesNamed: aCollectionOfSampleSelectors
	"Answer a collection of instances of me, with the selectors. Each selector should define a class-side method."

	^ self samplesNamed: aCollectionOfSampleSelectors problemSize: self defaultProblemSize