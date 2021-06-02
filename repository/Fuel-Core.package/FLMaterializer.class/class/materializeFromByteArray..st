materializing-shortcuts
materializeFromByteArray: byteArray

	^(self new materializeFrom: byteArray readStream) root