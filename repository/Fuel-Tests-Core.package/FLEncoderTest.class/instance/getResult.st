helpers
getResult
	| contents|
	encoder flush.
	contents := stream contents.
	stream reset.
	^ contents