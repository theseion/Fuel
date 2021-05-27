tests
testDateAndTimeOffsetNegative
	| edt now |
	edt := TimeZone timeZones last.
	
	DateAndTime localTimeZone: edt.
	now := DateAndTime now.
	self assert: now offset equals: -4 hours.
	self serialize: now.

	self assert: self materialized offset equals: -4 hours