sample creation
primitiveSamples
	^ (self allSubclasses 
		select: [:aClass | aClass sampleTags includes: #primitive])
		gather: [:aClass | aClass samples]