tests
testNotFoundAfterRemoval
	"Tests that serializer does not tolarate when the class was removed between serialization and materialization"
	
	| class |
	class := self newClass.
	
	self serialize: class.
	self removeFromSystem: class.
	
	self should: [self materialized] raise: FLClassNotFound.