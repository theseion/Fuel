materializing
basicMaterialize
	| decoder header materialization |
	decoder := FLDecoder new.
	self verifySignatureFrom: decoder.
	self verifyVersionFrom: decoder.
	header := self decodeHeaderWith: decoder.
	header executePreMaterializationActions.
	materialization := FLMaterialization runWith: decoder.
	"This is useful because when the user materialize something, what it is answered is the materialization objet, and not the materializer. Hence, it is difficult to query the header (like asking the additionalObjects) because materializer is lost. Therefore, we also set the header to the materialization."
	materialization header: header. 
	self context materialization: materialization.
	header executePostMaterializationActions.
	^ materialization