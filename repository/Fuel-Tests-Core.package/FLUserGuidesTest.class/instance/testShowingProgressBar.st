tests-Getting Started
testShowingProgressBar
	(self environmentOfTest includesKey: #FLProgressSerialization)
		ifFalse: [
			" Needs: FuelProgressUpdate package"
			^ self skip ].
	
	FLSerializerConfiguration new 
		showProgress;
		object: (1 to: 200000) asArray;
		fileName: 'numbers.fuel';
		serialize.
	FLMaterializerConfiguration new
		showProgress;
		fileName: 'numbers.fuel';
		materialize