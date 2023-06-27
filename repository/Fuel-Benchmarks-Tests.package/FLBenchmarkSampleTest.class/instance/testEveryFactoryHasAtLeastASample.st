tests
testEveryFactoryHasAtLeastASample

	FLSampleFactory allSubclasses do: [ :aFactory |
		self deny: aFactory sampleSelectors isEmpty ]