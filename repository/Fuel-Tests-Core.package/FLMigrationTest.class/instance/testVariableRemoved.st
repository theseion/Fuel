tests-automatic
testVariableRemoved
	"Tests that serializer tolarates when an instance variable is missing on materialization"

	| pairClass aPair resultPair |
	pairClass := self classFactory silentlyNewClassWithInstanceVariableNames: 'left right'.
	aPair := pairClass new.
	aPair instVarAt: 1 put: $A.
	aPair instVarAt: 2 put: $B.

	self serialize: aPair.
	self redefined: pairClass with: 'right'.
	resultPair := self materialized.

	self assert: $B equals: (resultPair instVarAt: 1)