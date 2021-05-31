running
tearDownGlobalVariables
	self environmentOfTest
		removeKey: #FLGlobalVariableForTesting
		ifAbsent: []