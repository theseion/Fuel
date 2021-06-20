tests
testGlobalClassNotFound
	"If a class is not defined in the materialization environment, a proper error should be raised."

	self serialize: Integer.
	
	self materializer environment: Dictionary new.
	
	self should: [ self materialized ] 
		raise: FLClassNotFound 
		description: 'Raise an error since the class is not present in materialization global environment'