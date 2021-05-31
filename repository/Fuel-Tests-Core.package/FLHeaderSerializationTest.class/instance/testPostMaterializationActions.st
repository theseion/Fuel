tests
testPostMaterializationActions
	| aClass |
	aClass := self classFactory silentlyNewClassWithClassVariableNames: 'TestClassVariable TestClassVariable2'.
	aClass class
		duringTestCompileSilently: 'postLoadMethod  TestClassVariable := 1';
		duringTestCompileSilently: 'postLoadMethod2  TestClassVariable := 2';
		duringTestCompileSilently: 'classVariable  ^TestClassVariable '.

	aClass perform: #postLoadMethod.
	self assert: (aClass perform: #classVariable) equals: 1.
		self serializer
		at: #className
		putAdditionalObject: aClass name.
	"Cannot replace with testing environment for having clean blockClosure"
	self serializer addPostMaterializationAction: [ :materialization |
		"Can't use `self environmentOfTest` or `aClass name` here because the closure
		must be clean."
		(Smalltalk at: (materialization additionalObjectAt: #className))  perform: #postLoadMethod2 ].
	self serialize: aClass.
	self assert: (aClass perform: #classVariable) equals: 1.
	self materialized.
	self assert: (aClass perform: #classVariable) equals: 2