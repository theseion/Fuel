serialize/materialize
materializePostInstance: aMetaclass with: aDecoder

	| superclass instanceVariableNames format layout |
	superclass := aDecoder nextEncodedReference.
	instanceVariableNames := aDecoder nextEncodedString substrings: ' '.
	format := aDecoder nextEncodedUint24.
	layout := self materializeLayoutWith: aDecoder.

	aMetaclass
		basicSuperclass: superclass;
		methodDictionary: MethodDictionary new.
	
	self
		installLayout: layout
		withFormat: format
		variableNames: instanceVariableNames
		into: aMetaclass