private
headerStep
	"Make sure the contents of the encoder have been written to the stream
	so that the header encoder writes it's contents after those."
	encoder flush.
	
	FLHeaderSerializer new serialize