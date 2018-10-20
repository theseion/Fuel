serialize/materialize
materializePostInstance: aMetaclass with: aDecoder
	| superclass instanceVariableNames format layout |
	superclass := aDecoder nextEncodedReference.
	instanceVariableNames := aDecoder nextEncodedString substrings: ' '.
	format := aDecoder nextEncodedUint24.
	layout := self materializeLayoutWith: aDecoder.

	"The format will be derived from the class layout,
	so we must first install the layout before setting the format,
	as it may differ from the derived one"
	aMetaclass basicSuperclass: superclass.
	self
		installLayout: layout
		withVariableNames: instanceVariableNames
		into: aMetaclass.
	aMetaclass
		methodDictionary: MethodDictionary new;
		setFormat: format