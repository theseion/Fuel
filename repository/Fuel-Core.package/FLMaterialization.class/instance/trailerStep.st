private
trailerStep
	self context materializedObjects
		addRoot: decoder nextEncodedReference;
		addObjects: decoder objects