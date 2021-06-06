analyzing
add: anObject traceWith: aAnalysis
	"Add an object to the cluster and trace references."
	objects addIfNotPresent: anObject ifPresentDo: [ ^ self ].

	self 
		referencesOf: anObject 
		do: [ :aChild |
			self addReferenceFrom: anObject to: aChild.
			aAnalysis trace: aChild ].
		
	self
		variablePartReferencesOf: anObject
		do: [ :aChild |
			self addVariableReferenceFrom: anObject to: aChild.
			aAnalysis trace: aChild ]