tests
testNotFoundAfterRename
	"Tests that serializer does not tolarate when the class was renamed between serialization and materialization"
	
	| class |
	class := self newClass.
	
	self serialize: class.
	class renameSilently: (class name, 'Renamed') asSymbol.
	
	self should: [self materialized] raise: FLClassNotFound.