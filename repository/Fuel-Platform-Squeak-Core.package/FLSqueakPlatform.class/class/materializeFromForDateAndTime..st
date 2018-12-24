private-extensions-dateandtime
materializeFromForDateAndTime: aDecoder
	<flExtensionOf: #DateAndTime selector: #materializeFrom: isSource: true isMeta: true>
	<flExtensionClassSide>
	| jdn nanos seconds offset |
	jdn := aDecoder nextEncodedUint32.
	nanos :=  aDecoder nextEncodedUint32.
	seconds := aDecoder nextEncodedInt24.
	offset := Duration 
		seconds: aDecoder nextEncodedInt24 
		nanoSeconds: aDecoder nextEncodedInt32.
	self instSize = 2
		ifFalse: [ "traditional jdn, seconds, nanos, offset instance variables based on local time" ]
		ifTrue: [ "materialize to new format with UTC microseconds and local offset"
				seconds := seconds + offset asSeconds].
	^ self basicNew
		fuelSet: jdn nanoSecond: nanos seconds: seconds offset: offset;
		yourself
