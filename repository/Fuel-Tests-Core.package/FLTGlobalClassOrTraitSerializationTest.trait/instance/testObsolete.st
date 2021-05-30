tests
testObsolete
	"Tests that serializer does not serialize as global an obsolete class or trait."
	
	| class |
	class := self newClass.
	self removeFromSystem: class.

	self 
		should: [self serialize: class ] 
		raise: FLObsolete
		whoseDescriptionIncludes: class name
		description: 'Should raise an error when serializing as global an obsolete class or trait.' 