helpers
resultOfSerializeAndMaterializeMethod: aCompiledMethod
	self serializer fullySerializeMethod: aCompiledMethod. 
	self serialize: aCompiledMethod.
	^ self materialized
