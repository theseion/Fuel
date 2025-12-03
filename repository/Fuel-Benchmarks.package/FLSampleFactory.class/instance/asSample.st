building
asSample

	^ FLBenchmarkSample new
		title: selector asString;
		problemSize: problemSize;
		content: (self perform: selector);
		yourself