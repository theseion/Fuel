accessing
last
	^Last ifNil: [ self error: 'Log not initialized. Read my class comments: ', self class comment ]