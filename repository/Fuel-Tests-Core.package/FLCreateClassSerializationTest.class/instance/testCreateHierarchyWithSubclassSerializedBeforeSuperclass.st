tests-bugs
testCreateHierarchyWithSubclassSerializedBeforeSuperclass
	"Tests issue #210"
	
	| a b serializedClasses set |	
	a := self classFactory silentlyNewClass.
	b := self classFactory silentlyNewSubclassOf: a.
	serializedClasses := {a. b}.
	"Behavior clusters use an FLLargeIdentitySet for their objects.
	We need to be sure that the subclass is serialized before the superclass."
	serializedClasses reversed doWithIndex: [ :class :index |
		self classFactory
			silentlyCompile: 'largeIdentityHash ^ ', index asString
			in: class class ].
	set := FLLargeIdentitySet new
		addAll: serializedClasses;
		yourself.
	self assert: set asArray first == b.
	
	self
		shouldnt: [ self resultOfSerializeRemoveAndMaterializeAll: serializedClasses ]
		raise: MessageNotUnderstood