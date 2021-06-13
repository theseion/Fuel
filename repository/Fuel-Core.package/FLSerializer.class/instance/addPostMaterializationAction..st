configuring-materialization
addPostMaterializationAction: aCleanBlockClosure
	"Takes a clean (no dependency on outer variables) block closure which will be
	activated after materialization automatically.
	This closure takes two optional arguments:
		1. the header (FLHeader)
		2. the materialization (FLMateralization)
		3. the global environment
	
	Example: 
	
	configuration addPostMaterializationAction: [ :header :materialization :environment |
		| selector |
		selector := header additionalObjectAt: #selector.
		materialization root perform: 'Materialization done!' ]"
	
	aCleanBlockClosure isClean ifFalse: [
		FLConfigurationError signal: 'Post materializaton actions have to be clean closures. For more details see method BlocKClosure >> #isClean' ].
	
	(map
		at: #postMaterializationActions
		ifAbsentPut: [ IdentitySet new ])
			add: aCleanBlockClosure