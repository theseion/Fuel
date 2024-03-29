tests
testClassSideMethodNotFoundAfterRemoval
	"Tests that serializer does not tolarate when the method was removed between serialization and materialization"
	
	| classOrTrait |
	classOrTrait := self newClassOrTrait.
	self classFactory
		silentlyCompile: 'you'
		in: classOrTrait classSide.
	
	self serialize: classOrTrait classSide >> #you.
	classOrTrait classSide removeSelectorSilently: #you.
	
	self 
		should: [ self materialized ] 
		raise: FLMethodNotFound
		whoseDescriptionIncludes: classOrTrait classSide printString 
		description: 'Should raise an error when method is not present.'