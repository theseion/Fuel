private
silentlyDo: aBlock
	^ SystemAnnouncer uniqueInstance suspendAllWhile: aBlock