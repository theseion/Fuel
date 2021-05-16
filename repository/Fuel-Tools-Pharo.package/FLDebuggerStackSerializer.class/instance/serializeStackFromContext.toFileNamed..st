serializing
serializeStackFromContext: aContext toFileNamed: aFileName
	self
		encodeDebugInformation;
		addPostMaterializationAction: [ :materialization | 
		FLDebuggerStackMaterialization new
			interruptedContext: materialization root;
			signal ];
		serialize: aContext copyStack toFileNamed: aFileName