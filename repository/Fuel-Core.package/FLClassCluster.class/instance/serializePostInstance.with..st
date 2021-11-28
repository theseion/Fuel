serialize/materialize
serializePostInstance: aClass with: anEncoder

	anEncoder encodeReferenceTo: aClass superclass.
	"Do not use #basicCategory because since it may be lazily computed it may happen that it is still in nil. "
	anEncoder encodeReferenceTo: aClass category.
	anEncoder encodeReferenceTo: aClass getName.
	anEncoder encodeReferenceTo: aClass format.	
	self
		serializeLayout: aClass classLayout
		with: anEncoder.
	anEncoder encodeString: aClass instanceVariablesString.
	self flag: #todo. "The array of variable names represents a circularity problem between clusters: if we encode the reference to such array, then the cluster for arrays should be before of Class cluster. But this would disable us to serialize an array of internal classes."