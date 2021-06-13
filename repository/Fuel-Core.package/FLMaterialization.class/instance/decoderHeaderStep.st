private
decoderHeaderStep
	decoder decodeYourself.
	clusterCount := decoder nextEncodedUint32.
	clusters := OrderedCollection new: clusterCount.
	clusters resetTo: 1. "Hack that avoids OrderedCollection>>makeRoomAtLast"