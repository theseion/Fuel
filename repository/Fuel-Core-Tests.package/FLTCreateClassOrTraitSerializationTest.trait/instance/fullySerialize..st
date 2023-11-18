helpers
fullySerialize: aClass
	self serializer fullySerializeBehavior: aClass.
	self serialize: aClass