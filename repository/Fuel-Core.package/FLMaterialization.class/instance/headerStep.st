protected
headerStep
	header := FLHeaderMaterializer new materialize root.
	self context materializedObjects addHeader: header