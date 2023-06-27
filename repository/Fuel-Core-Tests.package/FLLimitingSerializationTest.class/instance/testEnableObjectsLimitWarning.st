tests
testEnableObjectsLimitWarning
	| root materialized |
	root := FLPair new
		left: (FLPair new
			left: 2;
			right: 3;
			yourself);
		right: 1;
		yourself.
	
	self serializer
		object: root;
		limitObjectsTo: 3;
		enableLimitObjectsException.
		
	self 
		should: [ self serializer serialize ]
		raise: FLObjectLimitExceededWarning.
	
	[ self serializer serialize ]
		on: FLObjectLimitExceededWarning
		do: [ :ex | ex resume ].
		
	materialized := self materialized.
	self assert: materialized left notNil.
	self assert: materialized right equals: 1.
	self assert: materialized left left isNil.
	self assert: materialized left right isNil