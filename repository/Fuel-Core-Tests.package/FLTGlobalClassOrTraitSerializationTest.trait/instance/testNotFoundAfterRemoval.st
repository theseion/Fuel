tests
testNotFoundAfterRemoval
	"Tests that serializer does not tolarate when the class was removed between serialization and materialization"
	
	| classOrTrait |
	classOrTrait := self newClassOrTrait.
	
	self serialize: classOrTrait.
	self classFactory 	delete: classOrTrait.
	
	self should: [self materialized] raise: FLClassNotFound.