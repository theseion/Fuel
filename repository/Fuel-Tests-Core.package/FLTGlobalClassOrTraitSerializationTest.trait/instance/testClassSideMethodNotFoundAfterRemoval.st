tests
testClassSideMethodNotFoundAfterRemoval
	"Tests that serializer does not tolarate when the method was removed between serialization and materialization"
	
	| class |
	class := self newClass.
	class classSide duringTestCompileSilently: 'you'.
	
	self serialize: class classSide >> #you.
	class classSide removeSelectorSilently: #you.
	
	self 
		should: [self materialized] 
		raise: FLMethodNotFound
		whoseDescriptionIncludes: class classSide printString 
		description: 'Should raise an error when method is not present.' 
	
