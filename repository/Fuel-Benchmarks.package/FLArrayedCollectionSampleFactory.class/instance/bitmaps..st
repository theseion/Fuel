private
bitmaps: eachSize

	^ (1 to: self problemSize * 40 // eachSize)
		collect: [ :i | 
			Bitmap withAll: (1 + i to: eachSize + i) ]