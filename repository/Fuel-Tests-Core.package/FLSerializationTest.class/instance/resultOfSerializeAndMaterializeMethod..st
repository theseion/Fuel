helpers
resultOfSerializeAndMaterializeMethod: aCompiledMethod
	self serializerConfig considerInternalMethod: aCompiledMethod. 
	self serialize: aCompiledMethod.
	^ self materialized
