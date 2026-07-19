sample creation
samplesNamed: aCollectionOfSampleSelectors problemSize: n
	"Answer a collection of instances of me, with the selectors. Each selector should define a class-side method." 

	^ aCollectionOfSampleSelectors collect: [ :aSelector | 
		self sampleNamed: aSelector problemSize: n ]