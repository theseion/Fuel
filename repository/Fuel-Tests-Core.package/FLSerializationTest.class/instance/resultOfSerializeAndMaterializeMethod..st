helpers
resultOfSerializeAndMaterializeMethod: aCompiledMethod
	self serializer considerInternalMethod: aCompiledMethod. 
	self serialize: aCompiledMethod.
	^ self materialized
