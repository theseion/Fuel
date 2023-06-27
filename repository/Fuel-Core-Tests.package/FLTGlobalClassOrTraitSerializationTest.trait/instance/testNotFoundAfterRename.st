tests
testNotFoundAfterRename
	"Tests that serializer does not tolarate when the class was renamed between serialization and materialization"
	
	| classOrTrait |
	classOrTrait := self newClassOrTrait.
	
	self serialize: classOrTrait.
	self classFactory
		silentlyRename: classOrTrait
		to: classOrTrait name, 'Renamed'.
	
	self should: [ self materialized ] raise: FLClassNotFound