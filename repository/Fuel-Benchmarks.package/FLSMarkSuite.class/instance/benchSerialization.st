benchmarking
benchSerialization
		FLSerializerConfiguration new
			object: self sampleContents;
			streamFactory: [ self streamFactory writeStream ];
			serialize