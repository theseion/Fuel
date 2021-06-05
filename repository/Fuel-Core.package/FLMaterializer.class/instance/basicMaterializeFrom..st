materializing
basicMaterializeFrom: aStream
	| decoder header materialization |
	decoder := FLDecoder 
		on: aStream 
		migrations: self configuration migrations 
		globalEnvironment: self configuration environment.
	self verifySignatureFrom: decoder.
	self verifyVersionFrom: decoder.
	header := self decodeHeaderWith: decoder.
	header executePreMaterializationActionsIn: self configuration environment.
	materialization := FLMaterialization runWith: decoder.
	"This is useful because when the user materialize something, what it is answered is the materialization objet, and not the materializer. Hence, it is difficult to query the header (like asking the additionalObjects) because materializer is lost. Therefore, we also set the header to the materialization."
	materialization header: header. 
	"This is useful because the postMaterializationActions may need to have access to the state of the materialization, for example, to the root"
	header materialization: materialization.
	header executePostMaterializationActionsIn: self configuration environment.
	^ materialization