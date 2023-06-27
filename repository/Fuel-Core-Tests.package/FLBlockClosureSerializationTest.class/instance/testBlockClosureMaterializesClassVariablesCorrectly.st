tests-change
testBlockClosureMaterializesClassVariablesCorrectly
	| class closure method |
	class := self classFactory silentlyNewClassWithClassVariableNames: 'ClassVariableForTesting'.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ [ ClassVariableForTesting ]'
		in: class.
	
	method := class methodNamed: #methodWithClosure.
	"Make sure we don't use global clusters here, which would simply perform a lookup"
	self serializer fullySerializeBehavior: method methodClass.
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