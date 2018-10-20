serialize/materialize
materializePostInstance: aClass with: aDecoder

	| superclass category name instanceVariableNames format layout |
	superclass := aDecoder nextEncodedReference.
	category := aDecoder nextEncodedReference.
	name := aDecoder nextEncodedReference.
	format := aDecoder nextEncodedReference.
	layout := self materializeLayoutWith: aDecoder.
	instanceVariableNames := aDecoder nextEncodedString substrings: ' '.

	"The format will be derived from the class layout,
	so we must first install the layout before setting the format,
	as it may differ from the derived one"
	aClass basicSuperclass: superclass.
	self
		installLayout: layout
		withVariableNames: instanceVariableNames
		into: aClass.
	aClass
		methodDictionary: MethodDictionary new;
		setFormat: format;
		setName: name;
		basicCategory: category