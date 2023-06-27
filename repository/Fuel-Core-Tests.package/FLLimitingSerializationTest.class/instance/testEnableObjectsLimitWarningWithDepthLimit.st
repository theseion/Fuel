tests
testEnableObjectsLimitWarningWithDepthLimit
	| root |
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
		limitDepthTo: 5;
		enableLimitObjectsException.
		
	self 
		should: [ self serializer serialize ]
		raise: FLObjectLimitExceededWarning.
		
	self serializer
		limitObjectsTo: 3;
		limitDepthTo: 1;
		enableLimitObjectsException.
		
	self 
		shouldnt: [ self serializer serialize ]
		raise: FLObjectLimitExceededWarning