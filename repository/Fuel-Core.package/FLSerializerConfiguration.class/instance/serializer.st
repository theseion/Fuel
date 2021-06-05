accessing
serializer
	^ serializer ifNil: [ serializer := FLSerializer new ]