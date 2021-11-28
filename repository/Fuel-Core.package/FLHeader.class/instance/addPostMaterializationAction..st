accessing
addPostMaterializationAction: aCleanBlockClosure
	"The closure receives the header, materialization and the global environment as optional arguments"
	aCleanBlockClosure isClean ifFalse: [ self error: 'Post materializaton actions have to be clean closures. For more details see method BlocKClosure >> #isClean' ].
	postMaterializationActions add: aCleanBlockClosure