sample creation
samplesNamed: aCollectionOfSampleSelectors
	"Answer a collection of instances of me, with the selectors. Each selector should define a class-side method." 
	^aCollectionOfSampleSelectors
		collect: [ :aSelector | 
			(self withAllSubclasses detect: [:each | each includesSelector: aSelector ])
				sampleNamed: aSelector ]