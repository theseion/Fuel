tests-strings
testWideStringClassName
	| class className |	
	className := 'Foox' asWideString
		at: 4 put: (Character value: 265);
		yourself.
	class := Class new setName: className; yourself.
	self environmentOfTest
		at: class name
		put: class.
		
	self
		shouldnt: [ self resultOfSerializeAndMaterialize: class ]
		raise: FLClassNotFound