tests
testPostMaterializationActions

	| aClass |
	CompilationContext optionCleanBlockClosure ifTrue: [ ^ self skip ].

	aClass := self classFactory make: [ :aBuilder | aBuilder sharedVariables: #(TestClassVariable TestClassVariable2) ].
	self classFactory
		silentlyCompile: 'postLoadMethod TestClassVariable := 1' in: aClass class;
		silentlyCompile: 'postLoadMethod2 TestClassVariable := 2' in: aClass class;
		silentlyCompile: 'classVariable ^ TestClassVariable ' in: aClass class.

	aClass perform: #postLoadMethod.
	self assert: (aClass perform: #classVariable) equals: 1.
	self serializer
		at: #className putAdditionalObject: aClass name;
		fullySerializeBehavior: aClass;
		addPostMaterializationAction: [ :materializedObjects :environment |
			(environment at: (materializedObjects additionalObjectAt: #className)) perform: #postLoadMethod2 ].
	self serialize: aClass.
	self assert: (aClass perform: #classVariable) equals: 1.
	self materialized.
	self assert: (aClass perform: #classVariable) equals: 2