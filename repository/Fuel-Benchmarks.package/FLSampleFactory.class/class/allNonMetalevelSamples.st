sample creation
allNonMetalevelSamples
	^ (self allSubclasses 
		reject: [:aClass | aClass sampleTags includes: #metalevel])
		gather: [:aClass | aClass samples]