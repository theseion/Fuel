initialize-release
initializeWithInternalBehaviors: explicitInternals internalMethods: methods globalSymbols: explicitExternals globalEnvironment: globalEnvironment

	self initialize.
	clusterByObject := FLLargeIdentityDictionary new.
	internalBehaviors := explicitInternals.
	internalMethods := methods.
	globalSymbols := explicitExternals.
	globalsCluster := FLGlobalValueCluster newAnalyzing.
	instanceSideCluster := FLGlobalClassCluster newAnalyzing.
	classSideCluster := FLGlobalClassSideCluster newAnalyzing.
	classVariablesCluster := FLGlobalClassPoolAssociationCluster newAnalyzing.
	globalAssociationCluster := FLGlobalAssociationCluster newAnalyzing.
	globalCompiledMethodCluster := FLGlobalCompiledMethodCluster newAnalyzing.
	self cacheGlobalsIn: globalEnvironment.