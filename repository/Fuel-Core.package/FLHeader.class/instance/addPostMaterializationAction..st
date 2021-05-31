accessing
addPostMaterializationAction: aCleanBlockClosure
	"The closure receives the materialization as optional argument"
	aCleanBlockClosure isClean ifFalse: [ self error: 'Post materializaton actions have to be clean closures. For more details see method BlocKClosure >> #isClean' ].
	postMaterializationActions add: aCleanBlockClosure 