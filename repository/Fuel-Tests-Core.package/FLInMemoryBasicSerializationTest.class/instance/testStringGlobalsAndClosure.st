tests
testStringGlobalsAndClosure
	| materialized |
	materialized := self
		resultOfSerializeAndMaterialize:
			(Array
				with: 'a string'
				with: Smalltalk
				with: [ Smalltalk vm.
					'a string' ]).
	self assert: materialized first equals: 'a string'.
	self assert: materialized second identicalTo: Smalltalk