serialize/materialize
materializePostInstance: aMetaclass with: aDecoder

	| superclass instanceVariableNames layout |
	superclass := aDecoder nextEncodedReference.
	instanceVariableNames := aDecoder nextEncodedString substrings: ' '.
	aDecoder nextEncodedUint24. "format"
	layout := self materializeLayoutWith: aDecoder.

	aMetaclass
		basicSuperclass: superclass;
		methodDictionary: MethodDictionary new.
	
	self
		installLayout: layout
		withVariableNames: instanceVariableNames
		into: aMetaclass