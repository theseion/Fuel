tests-change
testBlockClosureMaterializesClassVariablesCorrectly
	| class closure method |
	class := (self
		newSubclassOf: Object
		instanceVariableNames: ''
		classVariableNames: 'ClassVariableForTesting')
			duringTestCompileSilently: 'methodWithClosure  ^ [ ClassVariableForTesting ]';
			yourself.
	"Make sure we don't use global clusters here, which would simply perform a lookup"
	method := class methodNamed: #methodWithClosure.
	closure := method
		valueWithReceiver: class new
		arguments: #().
	class removeSelectorSilently: #methodWithClosure.
	self deny: method isInstalled.
	self deny: closure compiledBlock isInstalled.
	
	self serialize: closure.
	
	self
		assert: (self materialized compiledBlock literalAt: 1)
		equals: (class bindingOf: 'ClassVariableForTesting').
	self
		deny: (self materialized compiledBlock literalAt: 1)
		identicalTo: (class bindingOf: 'ClassVariableForTesting')