serialize/materialize
materializePostInstance: aClass with: aDecoder

	| superclass category name instanceVariableNames format layout |
	superclass := aDecoder nextEncodedReference.
	category := aDecoder nextEncodedReference.
	name := aDecoder nextEncodedReference.
	format := aDecoder nextEncodedReference.
	layout := self materializeLayoutWith: aDecoder.
	instanceVariableNames := aDecoder nextEncodedString substrings: ' '.

	aClass 
		superclass: superclass;
		setFormat: format;
		setName: name;
		basicCategory: category; 
		methodDict: MethodDictionary new.
	self
		installLayout: layout
		withVariableNames: instanceVariableNames
		into: aClass