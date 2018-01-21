serialize/materialize
materializePostInstance: aMetaclass with: aDecoder

	| superclass instanceVariableNames format layout |
	superclass := aDecoder nextEncodedReference.
	instanceVariableNames := aDecoder nextEncodedString substrings: ' '.
	format := aDecoder nextEncodedUint24.
	layout := self materializeLayoutWith: aDecoder.

	aMetaclass
		superclass: superclass 
		methodDictionary: MethodDictionary new 
		format: format.
	
	self
		installLayout: layout
		withVariableNames: instanceVariableNames
		into: aMetaclass