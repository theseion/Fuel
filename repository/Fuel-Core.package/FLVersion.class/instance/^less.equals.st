comparing
<= aVersion
	self class ~= aVersion class ifTrue: [ ^ false ].
	
	self major > aVersion major ifTrue: [ ^ false ].
	self major < aVersion major ifTrue: [ ^ true ].
	
	self minor > aVersion minor ifTrue: [ ^ false ].
	self minor < aVersion minor ifTrue: [ ^ true ].
	
	self patch > aVersion patch ifTrue: [ ^ false ].
	
	^ true