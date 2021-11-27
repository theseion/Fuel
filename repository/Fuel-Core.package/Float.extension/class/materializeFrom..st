*Fuel-Core
materializeFrom: aDecoder
	"The * 1 is here to give a chance to the VM to create a SmallFloat64 if it can (thanks Nicolas Cellier)."
	
	^ (BoxedFloat64 new: 2)
		at: 1 put: aDecoder nextEncodedUint32;
		at: 2 put: aDecoder nextEncodedUint32;
		* 1.