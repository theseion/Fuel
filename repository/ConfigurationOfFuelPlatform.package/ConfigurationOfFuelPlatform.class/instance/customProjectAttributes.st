accessing
customProjectAttributes
	^ customProjectAttributes ifNil: [ customProjectAttributes := self platformAttributes ]