comparing
= aVersion
	^ super = aVersion or: [
		self class = aVersion class and: [
			self major = aVersion major and: [
				self minor = aVersion minor and: [
					self patch = aVersion patch ] ] ] ]