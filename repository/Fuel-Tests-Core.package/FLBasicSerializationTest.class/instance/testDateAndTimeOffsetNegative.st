tests
testDateAndTimeOffsetNegative
	| est now |
	est := TimeZone timeZones detect: [ :timeZone |
		timeZone abbreviation = 'EST' ].
	
	DateAndTime localTimeZone: est.
	now := DateAndTime now.
	self assert: now offset equals: -5 hours.
	self serialize: now.

	self assert: self materialized offset equals: -5 hours