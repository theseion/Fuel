*Fuel-Core
bytecodesHashBytesDo: aBlock
	self 
		from: self initialPC 
		to: self endPC 
		do: aBlock