tests-configuring-stream
testStreamFinalizerDefault

	<ignoreNotImplementedSelectors: #( _log )>
	| logClass log |
	logClass := self classFactory silentlyMake: [ :aBuilder | aBuilder slots: #(log) ].
	self classFactory
		silentlyCompile: 'initialize log := OrderedCollection new' in: logClass;
		silentlyCompile: '_log ^ log' in: logClass;
		silentlyCompile: 'doesNotUnderstand: aMessage log add: aMessage selector. ^ self' in: logClass.
	log := logClass new.
	FLSerializer new streamFinalizer value: log.
	self assert: log _log size equals: 1.
	self assert: log _log first equals: #close.

	log := logClass new.
	FLMaterializer new streamFinalizer value: log.
	self assert: log _log size equals: 1.
	self assert: log _log first equals: #close