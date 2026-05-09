tests-strings
testWideStringClassName

	| class className |
	className := 'Foox' asWideString
		             at: 4 put: (Character value: 265);
		             yourself.
	class := self classFactory silentlyMake: [ :builder | builder name: className ].
	self environmentOfTest at: class name put: class.

	self shouldnt: [ self resultOfSerializeAndMaterialize: class ] raise: FLClassNotFound