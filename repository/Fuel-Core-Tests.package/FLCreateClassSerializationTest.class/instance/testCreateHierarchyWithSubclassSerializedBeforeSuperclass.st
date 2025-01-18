tests-bugs
testCreateHierarchyWithSubclassSerializedBeforeSuperclass
	"Tests issue #210
	See FLBehaviorCluster>>registerIndexesOn:"

	| a b serializedClasses |
	a := self classFactory silentlyNewClass.
	b := self classFactory silentlyMake: [ :aBuilder | aBuilder superclass: a ].
	serializedClasses := { a . b }.

	self shouldnt: [ self resultOfSerializeRemoveAndMaterializeAll: serializedClasses ] raise: MessageNotUnderstood.
	
	serializedClasses := { b. a}.
	self shouldnt: [ self resultOfSerializeRemoveAndMaterializeAll: serializedClasses ] raise: MessageNotUnderstood