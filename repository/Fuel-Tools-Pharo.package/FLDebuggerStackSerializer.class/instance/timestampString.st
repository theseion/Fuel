private
timestampString
	^ String streamContents: [ :stream |
		stream
			print: Date today;
			space;
			print: Time now ]