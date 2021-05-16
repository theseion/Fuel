*Fuel-Tools-Pharo
fuelOutStackCommandWith: aPresenter forRootGroup: aCmCommandsGroup
	<extensionCommands>
	| command stackGroupName stackGroup |
	command := StFuelOutStackCommand forSpecContext: aPresenter.
	stackGroupName := StDebuggerStackCommandTreeBuilder new stackGroupName.
	stackGroup := aCmCommandsGroup / stackGroupName / stackGroupName.
	stackGroup register: command