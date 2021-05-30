tests-change
testBlockClosureMaterializesClassVariablesCorrectly
	| class closure method |
	class := (self
		newSubclassOf: Object
		instanceVariableNames: ''
		classVariableNames: 'ClassVariableForTesting')
			duringTestCompileSilently: 'methodWithClosure  ^ [ ClassVariableForTesting ]';
			yourself.
	
	method := class methodNamed: #methodWithClosure.
	"Make sure we don't use global clusters here, which would simply perform a lookup"
	self analyzer considerInternalBehavior: method methodClass.
	closure := method
		valueWithReceiver: class new
		arguments: #().
	
	self serialize: closure.
	
	self
		assert: (self materialized compiledBlock literalAt: 1)
		equals: (class bindingOf: 'ClassVariableForTesting').
	self
		deny: (self materialized compiledBlock literalAt: 1)
		identicalTo: (class bindingOf: 'ClassVariableForTesting')