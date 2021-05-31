tests-automatic
testVariableOrderChange
	"Tests that serializer tolarates when the order in the instance variables changed between serialization and materialization"

	| pairClass aPair resultPair |
	pairClass := self classFactory silentlyNewClassWithInstanceVariableNames: 'left right'.
	aPair := pairClass new.
	aPair instVarAt: 1 put: $A.
	aPair instVarAt: 2 put: $B.

	self serialize: aPair.
	self redefined: pairClass with: 'right left'.
	resultPair := self materialized.

	self assert: $B equals: (resultPair instVarAt: 1).
	self assert: $A equals: (resultPair instVarAt: 2)