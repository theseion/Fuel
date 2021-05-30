tests
testMethodNotFoundAfterRemoval
	"Tests that serializer does not tolarate when the method was removed between serialization and materialization"
	
	| class |
	class := self newClass.
	class duringTestCompileSilently: 'you'.
	
	self serialize: class >> #you.
	class removeSelectorSilently: #you.
	
	self 
		should: [self materialized] 
		raise: FLMethodNotFound
		whoseDescriptionIncludes: class name, '>>#you' 
		description: 'Should raise an error when method is not present.' 
	
