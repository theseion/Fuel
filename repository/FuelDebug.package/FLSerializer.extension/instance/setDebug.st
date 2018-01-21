*FuelDebug-configuring
setDebug

	^ serializationFactory := [:anObject :anEncoder | 
		(FLDebugSerialization 
			with: anEncoder
			root: anObject 
			analyzer: self analyzer)
			run;
			yourself ]