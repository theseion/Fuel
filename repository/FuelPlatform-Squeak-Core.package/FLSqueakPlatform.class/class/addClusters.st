adding
addClusters
	| theSuperclass |
	Smalltalk
		at: #FLMethodContextCluster
		ifPresent: [ :x | ^ self ].
	
	"The second pass will use the correct superclass"
	theSuperclass := (Smalltalk
		at: #FLVariableObjectCluster
		ifPresent: [ :x | x ]).
	
	(theSuperclass ifNil: [ Object ]) subclass: #FLMethodContextCluster
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self hacksCategoryName