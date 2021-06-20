configuring-materialization
addPreMaterializationAction: aCleanBlockClosure
	"Takes a clean (no dependency on outer variables) block closure which will be
	activated before materialization automatically.
	This closure takes two optional arguments:
		1. the header (FLHeader)
		2. the global environment
	
	Example:
	
	configuration addPostMaterializationAction: [ :header :environment |
		environment at: (header additionalObjectAt: #transcripClassName)
			show: 'Materialization starting!' ]"
	aCleanBlockClosure isBlock ifFalse: [
		FLConfigurationError signal: 'Argument must be a block' ].
	
	aCleanBlockClosure isClean ifFalse: [
		FLConfigurationError signal: 'Pre materializaton actions have to be clean closures. For more details see method BlocKClosure >> #isClean' ].
	
	aCleanBlockClosure numArgs > 2 ifTrue: [
		FLConfigurationError signal: 'Block accepts too many arguments, only two will be passed' ].
	
	(map
		at: #preMaterializationActions
		ifAbsentPut: [ IdentitySet new ])
			add: aCleanBlockClosure