tests-bugs
testCreateHierarchyWithSubclassSerializedBeforeSuperclass
	"Tests issue #210"
	
	| a b serializedClasses set |	
	a := self newSubclassOf: Object instanceVariableNames: '' classVariableNames: ''.
	b := self newSubclassOf: a instanceVariableNames: '' classVariableNames: ''.
	serializedClasses := {a. b}.
	"Behavior clusters use an FLLargeIdentitySet for their objects.
	We need to be sure that the subclass is serialized before the superclass."
	serializedClasses reversed doWithIndex: [ :class :index |
		class class compile: 'largeIdentityHash ^ ', index asString ].
	set := FLLargeIdentitySet new
		addAll: serializedClasses;
		yourself.
	self assert: set asArray first == b.
	
	self
		shouldnt: [ self resultOfSerializeRemoveAndMaterializeAll: serializedClasses ]
		raise: MessageNotUnderstood