tests-numbers
testFloat
	{180.0.
	0.0.
	-0.0.
	11.22321.
	-11.22321.
	-132311.22321.
	1234567890.123456789.
	-1234567890.123456789.
	Float e.
	Float infinity.
	Float halfPi.
	Float negativeZero.
	Float halfPi.
	Float pi} 
		do: [ :aFloat | self assertSerializationEqualityOrIdentityOf: aFloat ]