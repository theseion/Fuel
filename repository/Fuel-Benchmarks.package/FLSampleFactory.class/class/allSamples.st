sample creation
allSamples
	^ Array streamContents: [ :stream |
		self withAllSubclasses do: [ :aClass | stream nextPutAll: aClass samples ] ]