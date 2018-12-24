private-extensions-dateandtime
serializeOnForDateAndTime: anEncoder
	<flExtensionOf: #DateAndTime selector: #serializeOn:>
	self class instSize = 2
		ifFalse: [
			"traditional jdn, seconds, nanos, offset instance variables based on local time"
			anEncoder
				encodeUint32: self julianDayNumberUTC;
			 	encodeUint32: self nanoSecond;
				encodeInt24: self secondsSinceMidnight
				]
		ifTrue: [
			"serialize from new format with UTC microseconds and local offset"
			| ticks |
			ticks := self ticks.
			anEncoder
				encodeUint32: (ticks at: 1);
			 	encodeUint32: (ticks at: 3);
				encodeInt24: (ticks at: 2) ].
	anEncoder
		encodeInt24: self offset asSeconds;
		encodeInt32: self offset nanoSeconds
