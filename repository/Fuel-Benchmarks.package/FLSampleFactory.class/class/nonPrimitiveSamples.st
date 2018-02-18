sample creation
nonPrimitiveSamples
	^ (self allSubclasses 
		select: [:aClass | aClass sampleTags includes: #nonPrimitive])
		gather: [:aClass | aClass samples]