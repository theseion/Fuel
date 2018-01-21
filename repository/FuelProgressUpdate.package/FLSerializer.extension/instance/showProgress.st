*FuelProgressUpdate-configuring
showProgress

	serializationFactory := [:anObject :anEncoder | 
		(FLProgressSerialization 
				with: anEncoder
				root: anObject 
				analyzer: self analyzer showProgress)
				run;
				yourself ]