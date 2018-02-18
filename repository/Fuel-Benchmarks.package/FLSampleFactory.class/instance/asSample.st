building
asSample

	^ FLBenchmarkSample 
		title: selector asString
		content: (self perform: selector) 