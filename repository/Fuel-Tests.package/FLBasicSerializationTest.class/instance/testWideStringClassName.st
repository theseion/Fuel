tests-strings
testWideStringClassName
	| class className |
	className := 'Foox' asWideString
		at: 4 put: (Character value: 265);
		yourself.
	class := Class new setName: className; yourself.
	[
		Smalltalk globals at: class name put: class.
		self
			shouldnt: [ self resultOfSerializeAndMaterialize: class ]
			raise: Error
	] ensure:[ Smalltalk globals removeKey: class name ]